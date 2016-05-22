class WinningMove
  class BottomDiagonal
    attr_reader :position, :token, :board

    def initialize(position, token, board)
      @position = position
      @token = token
      @board = board
    end

    def four_in_a_row?
      left_slots_match? || right_slots_match?
    end

    private

    def left_slots_match?
      left_slots.all? { |slot| slot.value == token } && left_slots.length == 4
    end

    def right_slots_match?
      right_slots.all? { |slot| slot.value == token } && right_slots.length == 4
    end

    def left_slots
      left_diagonal.select.with_index { |slot, index| index <= 3 }
    end

    def left_diagonal
      0.upto(smallest_left).collect do |index|
        board[rows[index]][left_slots_indexes[index]]
      end
    end

    def right_slots
      right_diagonal.select.with_index do |slot, index|
        index <= 3
      end
    end

    def right_diagonal
      # puts 'debugging'
      # puts "right_slots_indexes: #{right_slots_indexes}"
      # puts "smallest_right: #{smallest_right}"
      0.upto(smallest_right).collect do |index|
        board[rows[index]][right_slots_indexes[index]]
      end
    end

    def smallest_left
      [row_size, left_slots_size].min
    end

    def smallest_right
      [row_size, right_slots_size].min
    end

    def left_slots_indexes
      (0..slot_index).to_a.reverse
    end

    def right_slots_indexes
      (slot_index..6).to_a
    end

    def rows
      (row_index..5).to_a
    end

    def row_size
      rows.size - 1
    end

    def left_slots_size
      left_slots_indexes.size - 1
    end

    def right_slots_size
      right_slots_indexes.size - 1
    end

    def slot_index
      position.last
    end

    def row_index
      position.first
    end
  end
end
