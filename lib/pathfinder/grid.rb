module Pathfinder
  class Grid
    attr_accessor :length, :size, :rovers

    def initialize(length, size)
      @length = length
      @size = size
      @rovers = []
    end

  end
end
