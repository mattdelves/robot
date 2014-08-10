# coding: utf-8

class Play

  def initialize(file, board)
    @instructions = []
    @board = board
    file = File.open(file)
    file.each_line {|line| @instructions << line.strip}
    file.close
  end

  def execute
    @instructions.each { |instruction| @board.execute(instruction) }
  end

  def output
    @board.output
  end

  def instructions
    @instructions
  end

end
