class Grid < Array

  def initialize(x, y, seed=[])
    @width = x
    @height = y
    super(x) { Array.new(y) { Cell.new(false) } }
    seed(seed)
  end

  def deep_copy
    Marshal.load(Marshal.dump(self))
  end

  def live_neighbor_count_for(x, y)
    count = 0
    x_range(x).each do |curr_x|
      y_range(y).each do |curr_y|
        unless (curr_x == x && curr_y == y)
          count += 1 if self[curr_x][curr_y].live?
        end
      end
    end
    count
  end

  def to_s(live, dead)
    rows = map do |row|
      row.map { |cell| cell.live? ? live : dead }.join(" ")
    end
    rows.join("\n")
  end

private
  def x_range(x)
    west = x - 1 < 0 ? 0 : x - 1
    east = x + 1 > @width - 1 ? @width - 1 : x + 1
    west..east
  end

  def y_range(y)
    north = y - 1 < 0 ? 0 : y - 1
    south = y + 1 > @height - 1 ? @height - 1 : y + 1
    north..south
  end

  def seed(pattern)
    pattern.each do |x, y|
      self[x][y].live
    end
  end
end
