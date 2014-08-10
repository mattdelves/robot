class Robot

  def initialize(x, y, compass)
    @x = x
    @y = y
    @compass = compass
  end
  
  def location
    "#{@x},#{@y},#{orientation}"
  end

  def orientation
    @compass.orientation
  end

  def x
    @x
  end

  def y
    @y
  end

  def move
    case @compass.orientation
    when "NORTH"
      @y += 1
    when "EAST"
      @x += 1
    when "SOUTH"
      @y -= 1
    when "WEST"
      @x -= 1
    end
  end

  def rotateLeft
    @compass.rotateLeft
  end

  def rotateRight
    @compass.rotateRight
  end
end
