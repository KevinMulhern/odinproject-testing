require 'spec_helper'
require 'board'
require 'find_position'

RSpec.describe FindPosition do
  subject(:find_position) { FindPosition.new(position, board.board) }
  let(:position) { 1 }
  let(:board) { Board.new }
  let(:column) { Column.new(position, board.board) }

  describe '#new' do
    it 'initializes a new object' do
      expect(find_position).to be_an_instance_of(FindPosition)
    end
  end

  describe '#slot' do
    it 'returns the choosen slot' do
      expect(find_position.slot).to eql(board.board[5][1])
    end
  end

  describe '#index' do
    before do
      column.build.last.value = 'R'
    end
    
    it 'returns the choosen slots index on the board' do
      expect(find_position.index).to eql([5,1])
    end
  end
end
