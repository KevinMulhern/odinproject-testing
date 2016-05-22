class Column
  attr_reader :position, :board

  def initialize(position, board)
    @position = position
    @board = board
  end

  def build
    Array.new(6).map.with_index { |slot, index| slot = board[index][position]}
  end
end
