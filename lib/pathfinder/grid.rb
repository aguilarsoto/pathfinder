module Pathfinder
  class Grid
    attr_accessor :length, :size, :rovers

    def initialize(length, size)
      @length = length
      @size = size
      @rovers = []
    end

    def self.validate_and_create_grid(size_line)
      if size_line=~/^(\d+)\s+(\d+)\s*$/
        return self.new($1.to_i, $2.to_i)
      end
      raise Pathfinder::InvalidGridError
    end


    def valid_position?(rover)
     rover.x >= 0 && rover.x <= length &&
     rover.y >= 0 && rover.y <= size && 
     no_colitions(rover)
    end

    def no_colitions(rover)
      @rovers.each do |r|
        return false if r.x == rover.x && r.y == rover.y && not(r === rover)
      end
      true
    end
  end
end
