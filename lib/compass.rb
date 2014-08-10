class Compass

  def initialize(points)
    @points = points
  end

  def rotateLeft
    @points.rotate!(-1)
  end

  def rotateRight
    @points.rotate!
  end

  def orientation
    @points[0]
  end
  
end
