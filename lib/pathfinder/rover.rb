module Pathfinder
  class InvalidPositionError < Exception
  end

  class Rover
    attr_accessor :x, :y, :position
    POSITIONS =['N', 'E', 'S', 'W']

    def initialize(x, y, position, grid)
      @x = x
      @y = y
      @position = position
      @grid = grid
    end

    def move
      case @position
      when 'N'
        @x+=1
      when 'S'
        @x-=1
      when 'E'
        @y+=1
      when 'W'
        @y-=1
      end
      unless @grid.valid_position?(self)
        raise InvalidPositionError
      end
    end

    def rotate(direction)
      case direction
      when 'R'
        @position = move_right(@position)
      when 'L'
        @position = move_left(@position)
      end
    end

    def move_right(current_position)
      current_location = POSITIONS.index(current_position)
      new_location = current_location+1
      new_location = 0 if new_location >= POSITIONS.size
      POSITIONS[new_location]
    end

    def move_left(current_position)
      current_location = POSITIONS.index(current_position)
      new_location = current_location-1
      POSITIONS[new_location]
    end
  end
end

