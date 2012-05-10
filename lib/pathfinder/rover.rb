module Pathfinder
  class Rover
    attr_accessor :x, :y, :position
    POSITIONS =['N', 'E', 'S', 'W']

    def initialize(x, y, position, grid)
      @x = x
      @y = y
      @position = position
      @grid = grid
    end

    def self.validate_and_create_rover(position_line, grid)
      if position_line=~/^(\d+)\s+(\d+)\s+(N|S|W|E)\s*$/
        return self.new($1.to_i, $2.to_i, $3, grid)
      end
      raise Pathfinder::InvalidRoverError
    end

    def validate_and_move(move_line)
      if move_line =~ /^(R|L|M)+\s*$/
        move_line.split(//).each do|move_val|
          if move_val=="M"
            move
          else
            rotate(move_val)
          end
        end
        return true
      end
      raise Pathfinder::InvalidPositionError.new(self)
    end


    def move
      case @position
      when 'N'
        @y+=1
      when 'S'
        @y-=1
      when 'E'
        @x+=1
      when 'W'
        @x-=1
      end
      unless @grid.valid_position?(self)
        raise InvalidPositionError.new(self)
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

    def current_position
      "#{self.x} #{self.y} #{self.position}"
    end
  end
end

