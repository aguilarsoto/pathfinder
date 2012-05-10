require 'spec_helper'

describe Pathfinder do
  it "should follow the instructions for an application" do
    file = mock('file')
    File.stub!(:open).with("test_out", "w").and_return(file)
    file.should_receive(:puts).with("1 3 N")
    file.should_receive(:puts).with("5 1 E")
    Pathfinder.follow_instructions('spec/test_file', 'test_out')
  end
end
