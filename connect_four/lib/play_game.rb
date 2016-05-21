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

create_players
board = Board.new()
game = Game.new(players, board)

loop do
  # system 'clear'
  board.show
  position = game.get_position - 1
  game.set_position(position)
  if game.over?
    puts game.current_player.name
    break
  end
  game.switch_players
 end


