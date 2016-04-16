class Game
  attr_reader :players, :board, :current_player

  def initialize(players, board )
    @players = players
    @board = board
  end

  def current_player
    @current_player ||= player_1
  end

  def over?
    board.winner?
  end

  def get_position
    current_player.get_position
  end

  def switch_players
    @current_player = players.find { |player| player != current_player }
  end

  private

  def player_1
    players[0]
  end

  def player_2
    players[1]
  end
end