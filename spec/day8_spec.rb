require "spec_helper"
require_relative "../solutions/day8.rb"

RSpec.describe Day8 do
  describe "process" do
    let(:input) do
      <<~END
      RL

      BBB = (DDD, EEE)
      ZZZ = (ZZZ, ZZZ)
      DDD = (DDD, DDD)
      GGG = (GGG, GGG)
      EEE = (EEE, EEE)
      AAA = (BBB, CCC)
      CCC = (ZZZ, GGG)
      END
    end

    let(:input2) do
      <<~END
      LLR

      AAA = (BBB, BBB)
      BBB = (AAA, ZZZ)
      ZZZ = (ZZZ, ZZZ)
      END
    end

    it "counts steps" do
      expect(described_class.new.process(input)).to eq 2
      expect(described_class.new.process(input2)).to eq 6
    end
  end
end
