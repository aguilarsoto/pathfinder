require 'spec_helper'

describe Pathfinder::Grid do
  before :each do
    @grid = Pathfinder::Grid.new(5, 6)
  end

  it "should know the length, the size of the grid and initialize the rovers" do
    @grid.length.should == 5
    @grid.size.should == 6
    @grid.rovers.should == [] 
  end

  it "should only allow validate the position of rover to be on the grid" do
    rover = Pathfinder::Rover.new(2, 2, 'N', @grid)
    @grid.valid_position?(rover).should be_true
    rover = Pathfinder::Rover.new(-1, 0, 'N', @grid)
    @grid.valid_position?(rover).should be_false
    rover = Pathfinder::Rover.new(0, -1, 'N', @grid)
    @grid.valid_position?(rover).should be_false
    rover = Pathfinder::Rover.new(6, 0, 'N', @grid)
    @grid.valid_position?(rover).should be_false
    rover = Pathfinder::Rover.new(0, 7, 'N', @grid)
    @grid.valid_position?(rover).should be_false
  end
end
