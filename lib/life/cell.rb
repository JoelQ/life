class Cell

  def initialize(live)
    @live = live
  end

  def live?
    @live
  end

  def dead?
    !@live
  end

  def live
    @live = true
  end

  def kill
    @live = false
  end
end
