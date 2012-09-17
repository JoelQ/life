class World

  attr_reader :current

  def initialize(x, y)
    @current = Array.new(x, Array.new(y, Cell.new(false)))
  end
end
