require 'rspec/core/rake_task'

require_relative './lib/robot'
require_relative './lib/board'
require_relative './lib/play'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Play the robot game with the specified file"
task :play, [:file, :board] do |t, args|
  board = nil
  if args.board
    parts = args.board.match /(?<width>\d+)x(?<height>\d+)/
    board = Board.new(parts[:width], parts[:height])
  else
    board = Board.new
  end
  play = Play.new(args.file, board)
  play.execute
end
