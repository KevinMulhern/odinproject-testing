require 'game'

describe Game do
  subject(:game) { Game.new(players, board )}
  let(:players) {
    [
      player_1,
      player_2,
    ]
  }
  let(:board) { double('Board', winner?: winner ) }
  let(:player_1) { double('Player', color: 'Red', get_position: position) }
  let(:player_2) { double('Player', color: 'Yellow', get_position: position) }
  let(:position) { nil }
  let(:winner) { false }

  describe '#new' do
    it 'initializes a game with players and board' do
      expect(game).to be_instance_of(Game)
    end
  end

  describe '#current_player' do
    let(:current_player) { player_2 }

    before do
      allow(game).to receive(:current_player).and_return(current_player)
    end

    it 'will return the current player' do
      expect(game.current_player).to eql(player_2)
    end

    context 'when the game initialy starts' do
      let(:current_player) { player_1 }
      it 'will return player 1 as the current player' do
        expect(game.current_player).to eql(player_1)
      end
    end
  end

  describe '#over?' do
    it 'will return false when no one has won yet' do
      expect(game.over?).to eql(false)
    end

    context 'when a winning move has been made' do
      let(:winner) { true }

      it 'will return true' do
        expect(game.over?).to eql(true)
      end
    end
  end
end


# do I inject anything into game
# game will have two players, those can be injected in.
# game will have a board that can be injected in
