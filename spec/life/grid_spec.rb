require 'spec_helper'

describe Grid do

  describe ".new" do
    let(:grid) { Grid.new(10, 8) }
    it "should be a 2d array that is 10 wide" do
      grid.length.should eq 10
    end
    it "should be a 2d array that is 8 high" do
      grid.first.length.should eq 8
    end
    it "should be populated with dead cells" do
      grid[0][1].live?.should be_false
    end
  end

  describe "seed pattern" do
    let(:grid) { Grid.new(4,5, [[0,0], [1,2], [3,1]])}
    it "should be initialized correctly" do
      grid[0][0].should be_live
      grid[1][2].should be_live
      grid[3][1].should be_live
    end
  end
end
