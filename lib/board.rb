class Board

  attr_reader :width, :height

  def initialize(width = 5, height = 5)
    @width = width.to_i
    @height = height.to_i
  end

  def execute(instruction)
    executed = false

    case /^(?<command>(PLACE|MOVE|LEFT|RIGHT|REPORT))/.match(instruction)[:command]
    when "PLACE"
      executed = place(instruction)
    when "MOVE"
      executed = @robot.move if is_valid_move
    when "LEFT"
      executed = @robot.rotate_left
    when "RIGHT"
      executed = @robot.rotate_right
    when "REPORT"
      puts @robot.location
      executed = true
    end

    executed
  end

  def output
    @robot.location if @robot
  end

  def is_valid_move
    valid = false
    case @robot.orientation
    when "NORTH"
      valid = @robot.y < @height - 1
    when "EAST"
      valid = @robot.x < @width - 1
    when "SOUTH"
      valid = @robot.y > 0
    when "WEST"
      valid = @robot.x > 0
    end

    valid
  end

  def place(instruction)
    parts = instruction.match /PLACE (?<x>\d+),(?<y>\d+),(?<direction>(NORTH|SOUTH|EAST|WEST))/
    directions = %w(NORTH EAST SOUTH WEST)
    while !directions[0].eql?(parts[:direction])
      directions.rotate!
    end
    compass = Compass.new(directions)
    @robot = Robot.new(parts[:x].to_i, parts[:y].to_i, compass)

    @robot != nil
  end

end
