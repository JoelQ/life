require 'spec_helper'

describe Cell do
  describe "#live?" do
    context "when live" do
      let(:cell) { Cell.new(true) }
      it "should be true" do
        cell.live?.should be_true
      end
    end
    context "when dead" do
      let(:cell) { Cell.new(false) }
      it "should be false" do
        cell.live?.should be_false
      end
    end
  end

  describe "#live" do
    subject { cell }
    before { subject.live }
    context "when live" do
      let(:cell) { Cell.new(true) }
      it { should be_live }
    end
    context "when dead" do
      let(:cell) { Cell.new(false) }
      it { should be_live }
    end
  end
end
