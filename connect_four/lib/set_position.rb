require_relative 'column'

class SetPosition
  attr_reader :position, :token, :board

  def initialize(position, token, board)
    @position = position
    @token = token
    @board = board
  end

  def on_board
    board_position.value = token
  end

  private

  def board_position
    p last_empty_slot
    board[last_empty_slot][position - 1]
  end

  def column
    Column.new(position, board).make_column
  end

  def last_empty_slot
    column.index(find_empty_slots.last)
  end

  def find_empty_slots
    column.select { |slot, index| slot.value == " " }
  end
end