class World

  attr_reader :current

  def initialize(x, y, seed = [])
    @current = Array.new(x) { |ix| Array.new(y) {|iy| Cell.new(false)}}
    @next = @current.dup
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
    (x-1..x+1).each do |curr_x|
      (y-1..y+1).each do |curr_y|
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
          when 0..2 then cell.kill
          end
        end
      end
    end
  end

end
