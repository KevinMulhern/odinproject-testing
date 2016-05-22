require_relative '../column'

class WinningMove
  class Vertical
    attr_reader :position, :token, :board

    def initialize(position, token, board)
      @position = position
      @token = token
      @board = board
    end

    def four_in_a_row?
      below_slots_match? || above_slots_match?
    end

    private

    def below_slots_match?
      below_slots.all? { |slot| slot.value == token } && below_slots.length == 4
    end

    def above_slots_match?
      above_slots.all? { |slot| slot.value == token } && above_slots.length == 4
    end

    def below_slots
      column.select.with_index do |slot, index|
         index >= position_index && index <= slots_below_limit_index
       end
    end

    def above_slots
      column.select.with_index do |slot, index|
         index <= position_index && index >= slots_above_limit_index
       end
    end

    def slots_above_limit_index
      position_index - 3
    end

    def slots_below_limit_index
      position_index + 3
    end

    def column
      @column ||= Column.new(position[1], board).build
    end

    def position_index
      position.first
    end
  end
end
