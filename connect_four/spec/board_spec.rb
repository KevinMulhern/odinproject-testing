require 'board'

describe Board do
  subject(:board) { Board.new}

  describe '#new' do
    it 'intializes a new board' do
      expect(board).to be_instance_of(Board)
    end
  end
end

