require "pathfinder/version"
require "pathfinder/grid"
require "pathfinder/rover"

module Pathfinder
  class InvalidGridError < Exception
  end
  class InvalidRoverError < Exception
  end
  class InvalidPositionError < Exception
    attr_reader :rover
    def initialize(rover)
      @rover = rover
    end
  end

  def self.follow_instructions(file_in, file_out)
    pathfinder_file = open(file_in)
    pathfinder_out = File.open(file_out, 'w')
    grid = Pathfinder::Grid.validate_and_create_grid(pathfinder_file.gets)
    while(! pathfinder_file.eof?)
      rover_def = pathfinder_file.gets
      rover = Pathfinder::Rover.validate_and_create_rover(rover_def, grid)
      rover.validate_and_move(pathfinder_file.gets)
      grid.rovers<<rover
      pathfinder_out.puts(rover.current_position)
    end
  end
end
