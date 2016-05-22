require 'spec_helper'
require 'winning_move/horizontal'

class WinningMove
  RSpec.describe Horizontal do
    subject(:horizontal) { Horizontal.new(position, token, board) }
    let(:position) { [0, 1] }
    let(:token) { 'R'}
    let(:board) { [] }
    let(:row) { [slot, slot, slot, slot, slot, slot, slot] }
    let(:slot) { double('Slot', value: "" ) }
    let(:left_slots) {
      [left_slot, left_slot, left_slot, left_slot]
    }
    let(:left_slot) { double('Slot', value: left_slot_value) }
    let(:left_slot_value) { '' }
    let(:right_slots) {
      [right_slot, right_slot, right_slot, right_slot]
    }
    let(:right_slot) { double('Slot', value: right_slot_value) }
    let(:right_slot_value) { '' }

    before do
      allow(horizontal).to receive(:row).and_return(row)
      allow(horizontal).to receive(:left_slots).and_return(left_slots)
      allow(horizontal).to receive(:right_slots).and_return(right_slots)
    end

    describe '#initialize' do

      it 'initializes a new horizontal object' do
        expect(horizontal).to be_an_instance_of(Horizontal)
      end
    end

    describe '#four_in_a_row?' do
      context 'when only the left slots match' do
        let(:left_slot_value) { 'R' }

        it 'returns true' do
          expect(horizontal.four_in_a_row?).to eql(true)
        end

        context 'but does not have 4 slots' do
          let(:left_slots) {
            [left_slot, left_slot, left_slot]
          }

          it 'returns false' do
            expect(horizontal.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when only the right slots match' do
        let(:right_slot_value) { 'R' }

        it 'returns true' do
          expect(horizontal.four_in_a_row?).to eql(true)
        end

        context 'but does not have 4 slots' do
          let(:right_slots) {
            [right_slot, right_slot, right_slot]
          }

          it 'returns false' do
            expect(horizontal.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when both right and left slots match' do
        let(:right_slot_value) { 'R' }
        let(:left_slot_value) { 'R' }

        it 'returns true' do
          expect(horizontal.four_in_a_row?).to eql(true)
        end
      end

      context 'when neither the right or left slots match' do

        it 'returns false' do
          expect(horizontal.four_in_a_row?).to eql(false)
        end
      end
    end
  end
end
