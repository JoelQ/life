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

  describe "#deep_copy" do
    let(:grid) { Grid.new(3,4) }
    it "should create a distinct copy" do
     grid.deep_copy.should_not eq grid
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

  describe "#live_neighbor_count_for" do
    let(:grid) { Grid.new(3,3, [[1,0], [0,1], [2,1], [1,2]])}
    context "when NW corner" do
      it "should return the right amount" do
        grid.live_neighbor_count_for(0,0).should eq 2
      end
    end
    context "when SE corner" do
      it "should return the right amount" do
        grid.live_neighbor_count_for(2,2).should eq 2
      end
    end
    context "when center" do
      it "should return the right amount" do
        grid.live_neighbor_count_for(1,1).should eq 4
      end
    end
  end
end
