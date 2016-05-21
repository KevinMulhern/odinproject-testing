require_relative 'winning_move/vertical'
require_relative 'winning_move/horizontal'
class WinningMove
  attr_reader :position, :token, :board

  def initialize(position, token, board)
    @position = position
    @token = token
    @board = board
  end

  def any?
    winning_moves.any? { |move| move == true }
  end

  private

  def winning_moves
    [
      vertical_winning_move?
    ]
  end

  def horizontal_winning_move?
    WinningMove::Horizontal.new(position, token, board)
  end

  def vertical_winning_move?
    puts 'in the vertical'
    WinningMove::Vertical.new(position, token, board).four_in_a_row?
  end
end