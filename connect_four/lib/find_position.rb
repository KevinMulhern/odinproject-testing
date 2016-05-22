require_relative 'column'

class FindPosition
  attr_reader :position, :board

  def initialize(position, board)
    @position = position
    @board = board
  end

  def slot
    board[last_empty_slot][position]
  end

  def index
    [last_taken_slot, position]
  end

  def column_full?
    find_empty_slots.empty?
  end

  private

  def column
    Column.new(position, board).build
  end

  def last_taken_slot
    column.index(find_taken_slots.first)
  end

  def last_empty_slot
    column.index(find_empty_slots.last)
  end

  def find_taken_slots
    column.select { |slot| slot.value != "" }
  end

  def find_empty_slots
    column.select { |slot| slot.value == "" }
  end
end
