require "spec_helper"

describe World do
  describe "blank world" do
    let(:world) { World.new(10, 8) }
    it "should be populated by separate cells" do
      world.current[0][1].should_not eq world.current[1][1]
    end
  end

  describe "#duplicate_grid" do
    let(:world) { World.new(3,4) }
    it "should create a distinct copy" do
      world.duplicate_grid(world.current).should_not eq world.current
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

  describe "#live_neighbor_count_for" do
    context "when no neighbours" do
    let(:world) { World.new(3,3, [[1,1]])}
      it "should return the right amount" do
        world.live_neighbor_count_for(1,1).should eq 0
      end
    end
    context "when 3 neighbours" do
      let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2]])}
      it "should return the right amount" do
        world.live_neighbor_count_for(1,1).should eq 3
      end
    end
  end

  describe "Rules" do
    describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
      context "when 0 neighbours" do
        let(:world) { World.new(3,3, [[1,1]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end
      context "when 1 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end
    end


    describe "Any live cell with two or three live neighbours lives on to the next generation." do

      context "when 2 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1]]) }
        it "should be alive " do
          world.tick
          world.current[1][1].should be_live
        end
      end

      context "when 3 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2]]) }
        it "should be alive " do
          world.tick
          world.current[1][1].should be_live
        end
      end
    end

    describe "Any live cell with more than three live neighbours dies, as if by overcrowding." do
      context "when 4 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end

      context "when 5 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end

      context "when 6 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end

      context "when 7 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end

      context "when 8 neighbours" do
        let(:world) { World.new(3,3, [[1,1], [0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1], [2,2]]) }
        it "should be dead " do
          world.tick
          world.current[1][1].should be_dead
        end
      end
    end

    describe "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      let(:world) { World.new(3,3, [[0,0], [0,1], [0,2]]) }
      it "should be live " do
        world.tick
        world.current[1][1].should be_live
      end
    end

  end
end
