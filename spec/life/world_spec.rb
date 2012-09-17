require "spec_helper"

describe World do
  describe "blank world" do
    let(:world) { World.new(10, 8) }
    it "should be a 2d that is 10 wide" do
      world.current.length.should eq 10
    end
    it "should be a 2d that is 8 high" do
      world.current.first.length.should eq 8
    end
    it "should be populated with dead cells" do
      world.current[0][0].live?.should be_false
    end
  end
end
