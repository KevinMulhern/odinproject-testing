require 'spec_helper'
require 'winning_move/vertical'

class WinningMove
  RSpec.describe Vertical do
    subject(:vertical) { Vertical.new(position, token, board) }
    let(:position) { [0, 1] }
    let(:token) { 'R' }
    let(:board) { double('Board') }
    let(:column) { double('Column') }
    let(:column_slots) { [slot, slot, slot, slot, slot, slot] }
    let(:slot) { double('Slot', value: value) }
    let(:value) { "" }

    before do
      allow(Column).to receive(:new).with(position.first, board).
        and_return(column)
      allow(column).to receive(:build).and_return(column_slots)
    end

    describe '#initialize' do
      it 'initializes a new vertical object' do
        expect(vertical).to be_an_instance_of(Vertical)
      end
    end

    describe '#match?' do

      context 'when its possible to get 4 in slots in a row' do

        context 'when 4 slots in a row match' do

          it 'returns true' do

          end
        end

        context 'when there is not 4 in row' do
          it 'returns false' do

          end
        end
      end

      context 'when it is not possible to get 4 in a row' do
        it 'returns nil' do

        end
      end
    end
  end
end