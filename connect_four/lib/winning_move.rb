require_relative 'winning_move/vertical'
require_relative 'winning_move/horizontal'
require_relative 'winning_move/top_diagonal'
require_relative 'winning_move/bottom_diagonal'
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
      vertical_winning_move?,
      horizontal_winning_move?,
      top_diagonal_winning_move?,
      bottom_diagonal_winning_move?
    ]
  end

  def horizontal_winning_move?
    WinningMove::Horizontal.new(position, token, board).four_in_a_row?
  end

  def vertical_winning_move?
    WinningMove::Vertical.new(position, token, board).four_in_a_row?
  end

  def top_diagonal_winning_move?
    WinningMove::TopDiagonal.new(position, token, board).four_in_a_row?
  end

  def bottom_diagonal_winning_move?
    WinningMove::BottomDiagonal.new(position, token, board).four_in_a_row?
  end
end
