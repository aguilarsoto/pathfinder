module Pathfinder
  class Grid
    attr_accessor :length, :size, :rovers

    def initialize(length, size)
      @length = length
      @size = size
      @rovers = []
    end

    def valid_position?(rover)
     rover.x >= 0 && rover.x < length &&
     rover.y >= 0 && rover.y < size
    end
  end
end
