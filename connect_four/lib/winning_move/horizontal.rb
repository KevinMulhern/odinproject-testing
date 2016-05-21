class WinningMove
  class Horizontal
    attr_reader :position, :token

    def initialize(position, token)
      @position = position
      @token = token
    end
  end
end