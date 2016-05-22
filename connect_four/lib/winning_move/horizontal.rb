class WinningMove
  class Horizontal
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
      row.select.with_index do |slot, index|
        index <= position_index && index >= left_slot_limit_index
      end
    end

    def right_slots
      row.select.with_index do |slot, index|
        index >= position_index && index <= right_slot_limit_index
      end
    end

    def left_slot_limit_index
      position_index - 3
    end

    def right_slot_limit_index
      position_index + 3
    end

    def row
      board[row_index]
    end

    def row_index
      position[0]
    end

    def position_index
      position[1]
    end
  end
end
