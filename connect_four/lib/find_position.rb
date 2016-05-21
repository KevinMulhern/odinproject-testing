require_relative 'column'

class FindPosition
  attr_reader :position, :board

  def initialize(position, board)
    @position = position
    @board = board
    puts 'this is the index right now'
    p index.inspect
    puts 'why is the position fucking up'
    p position
    p last_empty_slot
  end

  def slot
    board[last_empty_slot][position]
  end

  def index
    [last_empty_slot + 1, position]
  end

  private

  def column
    Column.new(position, board).build
  end

  def last_empty_slot
    column.index(find_empty_slots.last)
  end

  def find_empty_slots
    column.select { |slot| slot.value == " " }
  end
end

