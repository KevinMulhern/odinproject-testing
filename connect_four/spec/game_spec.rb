require 'spec_helper'
require 'game'

RSpec.describe Game do
  subject(:game) { Game.new(players, board )}
  let(:players) {
    [
      player_1,
      player_2,
    ]
  }
  let(:board) { double('Board', winning_move?: winning_move, board: created_board ) }
  let(:player_1) { double('Player', token: 'R', get_position: position) }
  let(:player_2) { double('Player', token: 'Y', get_position: position) }
  let(:position) { nil }
  let(:winner) { false }
  let(:current_player) { player_1 }
  let(:winning_move) { }
  let(:find_position) { double('FindPosition', index: 5)}
  let(:created_board) { [] }

  before do
    allow(FindPosition).to receive(:new).with(nil, created_board).
      and_return(find_position)
    allow(game).to receive(:current_player).and_return(current_player)
  end

  describe '#new' do
    it 'initializes a game with players and board' do
      expect(game).to be_instance_of(Game)
    end
  end

  describe '#current_player' do
    let(:current_player) { player_2 }

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
    it 'calls winning_move? on board' do
      expect(board).to receive(:winning_move?).with(5, 'R')
      game.over?
    end
  end


  describe '#get_position' do
    before do
      allow(current_player).to receive(:get_position).and_return(2)
    end
    it 'return the current players chosen position' do
      expect(game.get_position).to eql(2)
    end
  end

  describe '#switch_players' do
    it 'will switch current player to player 2' do
      expect(game.switch_players).to eql(player_2)
    end

    context 'when current player is player 2' do
      let(:current_player) { player_2 }

      it 'will switch current player to player 1' do
        expect(game.switch_players).to eql(player_1)
      end
    end
  end
end
