require 'spec_helper'

describe Board do
  it "defaults to 5 x 5" do
    board = Board.new
    expect(board.width).to eql(5)
    expect(board.height).to eql(5)
  end

  it "knows the width" do
    board = Board.new(10, 10)
    expect(board.width).to eql(10)
  end

  it "knows the height" do
    board = Board.new(10, 10)
    expect(board.height).to eql(10)
  end

  context "validates the Robot's position" do
    before(:each) do
      @board = Board.new
    end

    context "facing NORTH" do
      it "is valid when y is less than 4 on a 5 x 5 board" do
        @board.execute("PLACE 2,3,NORTH")
        expect(@board.is_valid_move).to eql(true)
      end

      it "is not valid when y is greater or equal to 4 on a 5 x 5 board" do
        @board.execute("PLACE 2,4,NORTH")
        expect(@board.is_valid_move).to eql(false)
      end
    end

    context "facing EAST" do
      it "is valid when x is less than 4 on a 5 x 5 board" do
        @board.execute("PLACE 2,3,EAST")
        expect(@board.is_valid_move).to eql(true)
      end

      it "is not valid when x is greater or equal to 4 on a 5 x 5 board" do
        @board.execute("PLACE 4,2,EAST")
        expect(@board.is_valid_move).to eql(false)
      end
    end

    context "facing SOUTH" do
      it "is valid when y is less than 4 on a 5 x 5 board" do
        @board.execute("PLACE 2,2,SOUTH")
        expect(@board.is_valid_move).to eql(true)
      end

      it "is not valid when y is greater or equal to 4 on a 5 x 5 board" do
        @board.execute("PLACE 4,0,SOUTH")
        expect(@board.is_valid_move).to eql(false)
      end
    end
    
    context "facing WEST" do
      it "is valid when x is greater than 0 on a 5 x 5 board" do
        @board.execute("PLACE 2,3,WEST")
        expect(@board.is_valid_move).to eql(true)
      end

      it "is not valid when x is equal to 0 on a 5 x 5 board" do
        @board.execute("PLACE 0,2,WEST")
        expect(@board.is_valid_move).to eql(false)
      end
    end
  end
end
