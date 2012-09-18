class Grid < Array

  def initialize(x, y, seed=[])
    super(x) { Array.new(y) { Cell.new(false) } }
    seed(seed)
  end

private
  def seed(pattern)
    pattern.each do |coords|
      x = coords[0]
      y = coords[1]
      self[x][y].live
    end
  end
end
