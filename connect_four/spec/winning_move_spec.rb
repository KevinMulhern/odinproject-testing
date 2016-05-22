require 'spec_helper'
require 'winning_move'

RSpec.describe WinningMove do
  subject(:winning_move) { WinningMove.new(position, token, board) }
  let(:position) { [0][1] }
  let(:token) { 'R' }
  let(:board) { [] }
  let(:horizontal) { double('Horizontal', four_in_a_row?: horizontal_won ) }
  let(:vertical) { double('Vertical', four_in_a_row?: vertical_won ) }
  let(:top_diagonal) { double('TopDiagonal', four_in_a_row?: top_diagonal_won) }
  let(:bottom_diagonal) {
    double('BottomDiagonal', four_in_a_row?: bottom_diagonal_won)
  }
  let(:horizontal_won) { }
  let(:vertical_won) { }
  let(:top_diagonal_won) { }
  let(:bottom_diagonal_won) { }

  before do
    allow(WinningMove::Horizontal).to receive(:new).with(position, token, board).
      and_return(horizontal)

    allow(WinningMove::Vertical).to receive(:new).with(position, token, board).
      and_return(vertical)

    allow(WinningMove::TopDiagonal).to receive(:new).with(position, token, board).
      and_return(top_diagonal)

    allow(WinningMove::BottomDiagonal).to receive(:new).with(position, token, board).
      and_return(bottom_diagonal)
  end

  describe '#initialize' do
    it 'initializes a new winning moves object' do
      expect(winning_move).to be_an_instance_of(WinningMove)
    end
  end

  describe '#any?' do
    let(:top_diagonal_won) { true }

    it 'returns true when there is a winning move' do
      expect(winning_move.any?).to eql(true)
    end

    context 'when there are no winning moves' do
      let(:top_diagonal_won) { }
      
      it 'returns false' do
        expect(winning_move.any?).to eql(false)
      end
    end
  end
end
