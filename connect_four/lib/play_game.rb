require_relative 'game'
require_relative 'board'
require_relative 'player'

def colors
  ['red', 'yellow']
end

def players
  @players ||= []
end

def create_players
  i = 1
  while i <= 2
    print 'Hi, what is your name: '
    name = gets.chomp
    puts"you will be #{colors[i - 1]}"
    players << Player.new(name, colors[i])
    i += 1
  end
end


system 'clear'

create_players
board = Board.new([])
game = Game.new(players, board)

loop do
   board.set_position(game.get_position, game.current_player.color)
   break if game.over?
   game.switch_players
 end
















# grid = []
# board = Board.new(grid)
# game = Game.new(board)
#

#
#
#
# def create_players
#   Array.new(2) { Player.new()}
# end
#
# def colors
#   ['Red', 'yellow']
# end