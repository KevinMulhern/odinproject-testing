require 'spec_helper'
require 'winning_move/vertical'

class WinningMove
  RSpec.describe Vertical do
    subject(:vertical) { Vertical.new(position, token, board) }
    let(:position) { [0, 1] }
    let(:token) { 'R' }
    let(:board) { [] }
    let(:column) { double('Column') }
    let(:column_slots) { [slot, slot, slot, slot, slot, slot] }
    let(:slot) { double('Slot', value: "") }
    let(:below_slots) {
      [below_slot, below_slot, below_slot, below_slot]
    }
    let(:below_slot) { double('Slot', value: below_slot_value ) }
    let(:below_slot_value) { ' ' }
    let(:above_slots) {
      [above_slot, above_slot, above_slot, above_slot]
    }
    let(:above_slot) { double('Slot', value: above_slot_value ) }
    let(:above_slot_value) { ' ' }

    before do
      allow(Column).to receive(:new).with(1, board).
        and_return(column)
      allow(column).to receive(:build).and_return(column_slots)
      allow(vertical).to receive(:below_slots).and_return(below_slots)
      allow(vertical).to receive(:above_slots).and_return(above_slots)
    end

    describe '#initialize' do
      it 'initializes a new vertical object' do
        expect(vertical).to be_an_instance_of(Vertical)
      end
    end

    describe '#four_in_a_row?' do
      context 'when only below slots match' do
        let(:below_slot_value) { 'R' }

        it 'returns true when the 4 below slots match' do
          expect(vertical.four_in_a_row?).to eql(true)
        end

        context 'but below does not have 4 slots' do
          let(:below_slots) {
            [below_slot, below_slot, below_slot]
          }

          it 'returns false' do
            expect(vertical.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when only above slots match' do
        let(:below_slot_value) { '' }
        let(:above_slot_value) { 'R' }

        it 'returns true' do
          expect(vertical.four_in_a_row?).to eql(true)
        end

        context 'but above does not have 4 slots' do
          let(:above_slots) {
            [above_slot, above_slot, above_slot]
          }

          it 'returns false' do
            expect(vertical.four_in_a_row?).to eql(false)
          end
        end
      end

      context 'when both above and below_slots match' do
        let(:below_slot_value) { 'R' }
        let(:above_slot_value) { 'R' }

        it 'returns true' do
          expect(vertical.four_in_a_row?).to eql(true)
        end
      end

      context 'when neither above or below slots match' do
        let(:below_slot_value) { '' }
        let(:above_slot_value) { '' }

        it 'returns false' do
          expect(vertical.four_in_a_row?).to eql(false)
        end
      end
    end
  end
end
