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
      # puts 'general details'
      # puts position.inspect
      # puts token
      # p board
      # puts 'below slots'
      # p below_slots_match?
      # p below_slots
      # p below_slots.each { |slot| puts slot.value }
      # puts "above slots"
      # p above_slots_match?
      # p above_slots.each { |slot| puts slot.value }
      below_slots_match? || above_slots_match?
    end

    private

    def below_slots_match?
      below_slots.all? { |slot| slot.value == token }
    end

    def above_slots_match?
      above_slots.all? { |slot| slot.value == token }
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
      @column ||= Column.new(position.first, board).build
    end

    def position_index
      position.first
    end
  end
end