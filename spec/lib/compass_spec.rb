require 'spec_helper'

describe Compass do

  before(:each) do
    points = %w(foo bar baz)
    @compass = Compass.new(points)
  end
  
  it "knows it's orientation" do
    expect(@compass.orientation).to eql("foo")
  end

  it "can be rotated left" do
    @compass.rotate_left
    expect(@compass.orientation).to eql("baz")
  end

  it "can be rotated right" do
    @compass.rotate_right
    expect(@compass.orientation).to eql("bar")
  end
  
end
