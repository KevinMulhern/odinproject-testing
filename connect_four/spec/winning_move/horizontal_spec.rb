require 'spec_helper'
require 'winning_move/horizontal'

class WinningMove
  RSpec.describe Horizontal do
    subject(:horizontal) { Horizontal.new(position, token) }
    let(:position) { [0][1] }
    let(:token) { 'R'}

    describe '#initialize' do
      it 'initializes a new horizontal object' do
        expect(horizontal).to be_an_instance_of(Horizontal)
      end
    end
  end
end