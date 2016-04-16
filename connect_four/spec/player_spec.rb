require 'player'

describe Player do
  subject(:player) { Player.new(name, color) }
  let(:name) { 'Kevin' }
  let(:color) { 'Red' }

  describe '#new' do
    it 'will create a new player with name and color attributtes' do
      expect(player).to be_instance_of(Player)
    end
  end

  describe '#get_postion' do

    before do
      allow(player).to receive(:gets).and_return('2')
    end

    it 'asks the user for thier desired postion' do
      expect(player.get_position).to eql(1)
    end
  end
end