class Compass

  def initialize(points)
    @points = points
  end

  def rotate_left
    @points.rotate!(-1)
  end

  def rotate_right
    @points.rotate!
  end

  def orientation
    @points[0]
  end
  
end
