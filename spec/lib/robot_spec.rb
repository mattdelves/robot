require 'spec_helper'

describe Robot do

  it "can move" do
    robot = Robot.new(1, 1, Compass.new(%w(NORTH EAST SOUTH WEST)))
    robot.move
    expect(robot.location).to eql("1,2,NORTH")
  end

  it "can rotate left" do
    robot = Robot.new(1, 1, Compass.new(%w(NORTH EAST SOUTH WEST)))
    robot.rotate_left
    expect(robot.location).to eql("1,1,WEST")
  end

  it "can rotate right" do
    robot = Robot.new(1, 1, Compass.new(%w(NORTH EAST SOUTH WEST)))
    robot.rotate_right
    expect(robot.location).to eql("1,1,EAST")
  end
end
