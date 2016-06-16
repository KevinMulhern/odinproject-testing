require_relative 'slot'
require_relative 'winning_move'

class Board

  def set_position(slot, token)
    slot.value = token
  end

  def show
    board.each { |row| puts "| #{row_parser(row)} \n #{divider}" }
  end

  def board
    @board ||= Array.new(6) { Array.new(7) { slot } }
  end

  def winning_move?(position, token)
    WinningMove.new(position, token, board).any?
  end

  def draw?
    board.flatten.none? { |slots| slot.value === "" }
  end

  private

  def slot
    Slot.new
  end

  def row_parser(row)
    row.map { |slot| "  #{slot.value}  |" }.join
  end

  def divider
    "------" * row_size
  end

  def row_size
    board.first.size
  end
end
