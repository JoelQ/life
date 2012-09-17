class Cell

  def initialize(live)
    @live = live
  end

  def live?
    @live
  end

  def live
    @live = true
  end
end
