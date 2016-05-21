class Game
  attr_reader :players, :board, :current_player

  def initialize(players, board )
    @players = players
    @board = board
  end

  def current_player
    @current_player ||= player_1
  end

  def set_position(position)
    @find_position = nil
    board.set_position(find_position(position).slot, current_player.token)
  end

  def over?
    board.winning_move?(find_position.index, current_player.token)
  end

  def get_position
    current_player.get_position
  end

  def switch_players
    @current_player = players.find { |player| player != current_player }
  end

  private

  def find_position(position = nil)
    puts 'I think the problem is in here'
    @find_position ||= FindPosition.new(position, board.board)
  end

  def player_1
    players[0]
  end

  def player_2
    players[1]
  end
end