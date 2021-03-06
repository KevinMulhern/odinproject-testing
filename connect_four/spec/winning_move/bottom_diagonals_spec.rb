require 'spec_helper'
require 'winning_move/bottom_diagonal'

class WinningMove
  RSpec.describe BottomDiagonal do
    subject(:bottom_diagonal) { BottomDiagonal.new(position, token, board) }
    let(:position) { [0,3] }
    let(:token) { 'R' }
    let(:board) {
      [
        [slot, slot, slot, slot, slot, slot, slot],
        [slot, slot, slot, slot, slot, slot, slot],
        [slot, slot, slot, slot, slot, slot, slot],
        [slot, slot, slot, slot, slot, slot, slot],
        [slot, slot, slot, slot, slot, slot, slot],
        [slot, slot, slot, slot, slot, slot, slot],
      ]
    }
    let(:slot) { double('Slot', value: '' )}
    let(:right_slots) {
      [right_slot, right_slot, right_slot, right_slot]
    }
    let(:right_slot) { double('Slot', value: right_slot_value ) }
    let(:right_slot_value) { '' }
    let(:left_slots) {
      [left_slot, left_slot, left_slot, left_slot]
    }
    let(:left_slot) { double('Slot', value: left_slot_value ) }
    let(:left_slot_value) { '' }

    before do
      allow(bottom_diagonal).to receive(:left_slots).and_return(left_slots)
      allow(bottom_diagonal).to receive(:right_slots).and_return(right_slots)
    end

    describe '#four_in_a_row?' do
      context 'when only the left diagonal slots match' do
        let(:left_slot_value) { 'R' }

        it 'returns true' do
          expect(bottom_diagonal.four_in_a_row?).to eql(true)
        end

        context 'but it does not have 4 slots' do
          let(:left_slots) {
            [left_slot, left_slot, left_slot]
          }

          it 'returns false' do
            expect(bottom_diagonal.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when only the right diagonal slots match' do
        let(:right_slot_value) { 'R' }

        it 'returns true' do
          expect(bottom_diagonal.four_in_a_row?).to eql(true)
        end

        context 'but it does not have 4 slots' do
          let(:right_slots) {
            [right_slot, right_slot, right_slot]
          }

          it 'returns false' do
            expect(bottom_diagonal.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when both the right and left diagonal slots match' do
        let(:right_slot_value) { 'R' }
        let(:left_slot_value) { 'R' }

        it 'returns true' do
          expect(bottom_diagonal.four_in_a_row?).to eql(true)
        end
      end

      context 'when neither the left or right diagonal slots match' do
        it 'returns false' do
          expect(bottom_diagonal.four_in_a_row?).to eql(false)
        end
      end
    end
  end
end
