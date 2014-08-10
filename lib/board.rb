class Board
  def initialize(width = 5, height = 5)
    @width = width.to_i
    @height = height.to_i
  end

  def width
    @width
  end

  def height
    @height
  end
    
  def execute(instruction)
    executed = false

    if instruction.start_with?("PLACE")
      place(instruction)
      return true if @robot
    end

    if instruction.eql?("MOVE") && isValidMove
      @robot.move
      return true
    elsif instruction.eql?("LEFT")
      @robot.rotateLeft
      return true
    elsif instruction.eql?("RIGHT")
      @robot.rotateRight
      return true
    elsif instruction.eql?("REPORT")
      puts @robot.location
      return true
    end

    executed
  end

  def output
    @robot.location if @robot
  end

  def isValidMove
    case @robot.orientation
    when "NORTH"
      return true if @robot.y < @height - 1
    when "EAST"
      return true if @robot.x < @width - 1
    when "SOUTH"
      return true if @robot.y > 0
    when "WEST"
      return true if @robot.x > 0
    end

    return false
  end

  def place(instruction)
    parts = instruction.match /PLACE (?<x>\d+),(?<y>\d+),(?<direction>(NORTH|SOUTH|EAST|WEST))/
    directions = %w(NORTH EAST SOUTH WEST)
    while !directions[0].eql?(parts[:direction])
      directions.rotate!
    end
    compass = Compass.new(directions)
    @robot = Robot.new(parts[:x].to_i, parts[:y].to_i, compass)
  end

end
