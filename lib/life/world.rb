class World

  attr_reader :current

  def initialize(x, y, seed = [])
    @current = Array.new(x, Array.new(y, Cell.new(false)))
    @next = Array.new(x, Array.new(y, Cell.new(false)))
    seed(seed)
  end

  def seed(seed)
    seed.each do |cell_coords|
      x = cell_coords[0]
      y = cell_coords[1]
      current[x][y].live
    end
  end

  def tick

  end
end
