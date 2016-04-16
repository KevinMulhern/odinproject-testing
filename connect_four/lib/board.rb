require_relative 'slot'
require_relative 'set_position'
class Board

  def set_position(position, token)
    SetPosition.new(position, token, board).on_board
  end

  def show
    board.each { |row| puts "| #{row_parser(row)} \n #{divider}" }
  end

  def board
    @board ||= Array.new(6) { Array.new(7) { slot } }
  end

  private

  def row_parser(row)
    row.map  { |slot| "  #{slot.value}  |" }.join
  end

  def slot
    Slot.new
  end

  def divider
    "------" * row_size
  end

  def row_size
    board.first.size
  end
end

board = Board.new
board.show
board.set_position(2, '6')
board.show
board.set_position(2,'7')
board.show