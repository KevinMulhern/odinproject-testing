class Player

  attr_reader :name, :token
  def initialize(name, token)
    @name = name
    @token = token
  end

  def get_position
    print "Please enter a position between 1 and 6 #{name}: "
    gets.chomp.to_i
  end
end