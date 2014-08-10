require 'rspec'
require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
  add_group 'lib', './lib'
end if ENV["COVERAGE"]

require_relative '../lib/robot'
require_relative '../lib/board'
require_relative '../lib/play'
require_relative '../lib/compass'
