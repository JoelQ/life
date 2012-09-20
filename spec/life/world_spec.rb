require "spec_helper"

describe World do
  describe "blank world" do
    let(:world) { World.new(10, 8) }
    it "should be populated by separate cells" do
      world.current[0][1].should_not eq world.current[1][1]
    end
  end

  describe "seed pattern" do
    let(:world) { World.new(4,5, [[0,0], [1,2], [3,1]])}
    it "should be initialized correctly" do
      world.current[0][0].should be_live
      world.current[1][2].should be_live
      world.current[3][1].should be_live
    end
  end

  describe "to_s" do
    let(:world) { World.new(3,3, [[0,0], [1,2], [2,1]])}
    it "should output the correct string" do
      world.to_s("@", "_").should eq "@ _ _\n_ _ @\n_ @ _"
    end
  end

  describe "Rules" do
    before { world.tick }
    subject { world.current[1][1] }

    describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
      context "when 0 neighbours" do
        let(:world) { World.new(3,3, [[1,1]]) }
        it { should be_dead }
      end
      context "when 1 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0]]) }
        it { should be_dead }
      end
    end

    describe "Any live cell with two or three live neighbours lives on to the next generation." do
      context "when 2 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1]]) }
        it { should be_live }
      end

      context "when 3 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2]]) }
        it { should be_live }
      end
    end

    describe "Any live cell with more than three live neighbours dies, as if by overcrowding." do
      context "when 4 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0]]) }
        it { should be_dead }
      end

      context "when 5 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2]]) }
        it { should be_dead }
      end

      context "when 6 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0]]) }
        it { should be_dead }
      end

      context "when 7 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1]]) }
        it { should be_dead }
      end

      context "when 8 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1], [2,2]]) }
        it { should be_dead }
      end
    end

    describe "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      let(:world) { World.new(3,3, [[0,0], [0,1], [0,2]]) }
      it { should be_live }
    end

  end
end
