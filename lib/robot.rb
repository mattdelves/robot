class Robot

  attr_reader :x, :y

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

  def rotate_left
    @compass.rotate_left
  end

  def rotate_right
    @compass.rotate_right
  end
end
