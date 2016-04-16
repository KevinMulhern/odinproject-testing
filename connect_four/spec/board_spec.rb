require 'board'

describe Board do
  subject(:board) { Board.new(grid) }
  let(:grid) { double('Grid') }

  describe '#new' do
    it 'intializes a new board with a grid' do
      expect(board).to be_instance_of(Board)
    end
  end

  # describe '#set_position' do
  #   let(:position) { 1 }
  #   let(:player_colour) { 'Red' }
  # end
end

