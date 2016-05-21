require 'spec_helper'
require 'board'

RSpec.describe Board do
  subject(:board) { Board.new}
  let(:choosen_slot) { double('Slot') }
  let(:choosen_slot) { board.board[1][5]}
  let(:position) { 2 }
  let(:token) { 'R' }
  let(:slot) { double('Slot', value: "" )}
  let(:created_board) {
    [
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
    ]
  }

  describe '#new' do
    it 'intializes a new board' do
      expect(board).to be_instance_of(Board)
    end
  end

  describe '#set_position' do
    before do
      allow(slot).to receive(:value=).with(token)
    end

    it 'sets a position on the board' do
      board.set_position(choosen_slot, token)

      expect(board.board[1][5].value).to eql('R')
    end
  end

  describe '#show' do
    it 'outputs a board to the screen' do
      expect(board).to receive(:puts).at_least(6).times
      board.show
    end
  end

  describe '#board' do
    before do
      allow(Slot).to receive(:new).and_return(slot)
    end

    it 'returns a board' do
      expect(board.board).to eql(created_board)
    end
  end

  describe '#winning_move?' do
    let(:position) { [0, 1] }
    let(:token) { 'R' }
    let(:winning_move) { double('WinningMove') }

    before do
      allow(board).to receive(:board).and_return(created_board)

      allow(WinningMove).to receive(:new).
        with(position, token, created_board).and_return(winning_move)

      allow(winning_move).to receive(:any?).and_return(true)
    end

    it 'returns true when there is a winning move' do
      expect(board.winning_move?(position, token)).to eql(true)
    end

    context 'when there are no winning moves' do
      before do
        allow(winning_move).to receive(:any?).and_return(false)
      end

      it 'returns false' do
        expect(board.winning_move?(position, token)).to eql(false)
      end
    end
  end
end

