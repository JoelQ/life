class Grid < Array

  def initialize(x, y)
    super(x) { Array.new(y) { Cell.new(false) } }
  end
end
