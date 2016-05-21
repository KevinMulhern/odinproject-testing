require 'spec_helper'
require 'winning_move'

RSpec.describe WinningMove do
  subject(:winning_move) { WinningMove.new(position, token, board) }
  let(:position) { [0][1] }
  let(:token) { 'R' }
  let(:board) { double('Board') }

  describe '#initialize' do
    it 'initializes a new winning moves object' do
      expect(winning_move).to be_an_instance_of(WinningMove)
    end
  end

  describe '#any?' do
    
  end
end