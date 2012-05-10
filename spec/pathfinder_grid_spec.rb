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

  it "should allow only one rover per position" do
    rover0 = Pathfinder::Rover.new(2, 2, 'N', @grid)  
    @grid.rovers<<rover0
    rover = Pathfinder::Rover.new(2, 2, 'N', @grid)
    @grid.valid_position?(rover).should be_false
  end

  it "should create a grid if a valid line is provided" do
    grid = Pathfinder::Grid.validate_and_create_grid("5 6")
    grid.length.should == 5
    grid.size.should == 6

    grid = Pathfinder::Grid.validate_and_create_grid("5 60 ")
    grid.length.should == 5
    grid.size.should == 60
  end

  it "should raise an error if a invalid line is providad" do
    expect {
      Pathfinder::Grid.validate_and_create_grid("5 A")
    }.to raise_error(Pathfinder::InvalidGridError)
  end
end
