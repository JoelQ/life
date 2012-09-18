class World

  attr_reader :current

  def initialize(x, y, seed = [])
    @current = Array.new(x) { |ix| Array.new(y) {|iy| Cell.new(false)}}
    @next = duplicate_grid(@current)
    @width = x
    @height = y
    seed(seed)
  end

  def seed(seed)
    seed.each do |cell_coords|
      x = cell_coords[0]
      y = cell_coords[1]
      current[x][y].live
    end
  end

  def live_neighbor_count_for(x,y)
    count = 0
    west = x - 1 < 0 ? 0 : x - 1
    east = x + 1 > @width - 1 ? @width - 1 : x + 1
    north = y - 1 < 0 ? 0 : y - 1
    south = y + 1 > @height - 1 ? @height - 1 : y + 1
    (west..east).each do |curr_x|
      (north..south).each do |curr_y|
        count += 1 if current[curr_x][curr_y].live? unless curr_x == x && curr_y == y
      end
    end
    count
  end

  def tick
    current.each do |row|
      x = current.index(row)
      row.each do |cell|
        y = row.index(cell)
        if cell.live?
          case live_neighbor_count_for(x,y)
          when 0..1 then @next[x][y].kill
          when 2..3 then @next[x][y].live
          when 4..8 then @next[x][y].kill
          end
        elsif cell.dead? && live_neighbor_count_for(x,y) == 3
          @next[x][y].live
        end
      end
    end
    @current = @next.dup
  end

  def duplicate_grid(grid)
    Marshal.load(Marshal.dump(grid))
  end
end
