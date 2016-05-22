require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'find_position'

def colors
  ['R', 'Y']
end

def create_players
  2.times do |num|
    print 'Hi, what is your name: '
    name = gets.chomp
    puts"you will be #{colors[num - 1]}"
    players << Player.new(name, colors[num])
  end
end

def players
  @players ||= []
end

def full_column?(position, board)
  FindPosition.new(position, board).column_full?
end

create_players
board = Board.new()
game = Game.new(players, board)

loop do
  system 'clear'
  board.show
  position = game.get_position - 1
  puts position
  if position < 0 || position >= 7
    puts "please enter a valid column number"
    sleep 1
    redo
  end

  if full_column?(position, board.board)
    puts "column is full"
    sleep 1
    redo
  end

  game.set_position(position)
  if game.over?
    board.show
    puts "#{game.current_player.name} is the winner"
    break
  elsif board.draw?
    board.show
    puts "Game is a draw!"
    break
  end

  game.switch_players
 end
