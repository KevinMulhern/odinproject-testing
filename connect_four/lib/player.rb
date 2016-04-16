class Player

  attr_reader :name, :color
  def initialize(name, color)
    @name = name
    @color = color
  end

  def get_position
    print "Please enter a position between 1 and 6 #{name}: "
    gets.chomp.to_i - 1
  end
end