class World

  attr_reader :current

  def initialize(x, y, seed = [])
    @current = Array.new(x, Array.new(y, Cell.new(false)))
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
    0
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
