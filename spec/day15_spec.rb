require "spec_helper"
require_relative "../solutions/day15.rb"

RSpec.describe Day15 do
  describe "process" do
    let(:input) do
      <<~END
      rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 1320
    end
  end

  describe "algo" do
    it "hashes the string" do
      expect(described_class.new.algo("rn=1")).to eq 30
      expect(described_class.new.algo("ab=5")).to eq 197
      expect(described_class.new.algo("ot=7")).to eq 231
    end
  end
end
