class World

  attr_reader :current

  def initialize(x, y, seed = [])
    @current = Grid.new(x, y, seed)
    @next = @current.deep_copy
  end

  def tick
    current.each do |row|
      x = current.index(row)
      row.each do |cell|
        y = row.index(cell)
        if cell.live?
          case @current.live_neighbor_count_for(x,y)
          when 0..1 then @next[x][y].kill
          when 2..3 then @next[x][y].live
          when 4..8 then @next[x][y].kill
          end
        elsif cell.dead? && @current.live_neighbor_count_for(x,y) == 3
          @next[x][y].live
        end
      end
    end
    @current = @next.deep_copy
  end
end
