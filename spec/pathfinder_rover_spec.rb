require 'spec_helper'

describe Pathfinder::Rover do
  before :each do
    @grid = Pathfinder::Grid.new(15, 15)
    @rover = Pathfinder::Rover.new(6, 6, 'N', @grid)
  end

  it 'should know where he is pointing at' do
    @rover.y.should == 6
    @rover.x.should == 6
    @rover.position.should == 'N'
  end

    it 'should properly rotate to the right on the grid' do
    @rover.rotate('R')
    @rover.position.should == 'E'
    @rover.rotate('R')
    @rover.position.should == 'S'
    @rover.rotate('R')
    @rover.position.should == 'W'
    @rover.rotate('R')
    @rover.position.should == 'N'
  end


  it 'should properly rotate to the left on the grid' do
    @rover.rotate('L')
    @rover.position.should == 'W'
    @rover.rotate('L')
    @rover.position.should == 'S'
    @rover.rotate('L')
    @rover.position.should == 'E'
    @rover.rotate('L')
    @rover.position.should == 'N'
  end

  describe "stub valid_position" do
    before :each do  
      @grid.stub(:valid_position?).and_return(true)
    end
  
    it 'should properly move to the North' do
      @rover.move
      @rover.x.should == 7
      @rover.move
      @rover.x.should == 8
      @rover.move
      @rover.move
      @rover.x.should == 10
    end

    it 'should properly move to the East' do
      @rover.rotate('R')
      @rover.move
      @rover.y.should == 7
      @rover.move
      @rover.y.should == 8
      @rover.move
      @rover.move
      @rover.y.should == 10
    end

    it 'should properly move to the South' do
      @rover.rotate('R')
      @rover.rotate('R')
      @rover.move
      @rover.x.should == 5
      @rover.move
      @rover.x.should == 4
      @rover.move
      @rover.move
      @rover.x.should == 2
    end

    it 'should properly move to the East' do
      @rover.rotate('L')
      @rover.move
      @rover.y.should == 5
      @rover.move
      @rover.y.should == 4
      @rover.move
      @rover.move
      @rover.y.should == 2
    end
  end

  it "should raise an error on invalid positions" do
    @rover.rotate('L')
    6.times { @rover.move }
    expect { @rover.move }.to raise_error(Pathfinder::InvalidPositionError)
  end
end
