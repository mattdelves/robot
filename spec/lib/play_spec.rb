require 'spec_helper'

describe Play do

  it "reads the input from a file" do
    play = Play.new("spec/fixtures/test1.txt", Board.new)
    expect(play.instructions.count).to eql(3)
  end

  it "passes test 1" do
    play = Play.new("spec/fixtures/test1.txt", Board.new)
    play.execute
    expect(play.output).to eql("0,1,NORTH")
  end

  it "passes test 2" do
    play = Play.new("spec/fixtures/test2.txt", Board.new)
    play.execute
    expect(play.output).to eql("0,0,WEST")
  end

  it "passes test 3" do
    play = Play.new("spec/fixtures/test3.txt", Board.new)
    play.execute
    expect(play.output).to eql("3,3,NORTH")
  end

  it "passes crazy" do
    play = Play.new("spec/fixtures/test_crazy.txt", Board.new)
    play.execute
    expect(play.output).to eql("4,0,EAST")
  end
  
end
