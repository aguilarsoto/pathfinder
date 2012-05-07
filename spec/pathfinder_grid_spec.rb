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
end
