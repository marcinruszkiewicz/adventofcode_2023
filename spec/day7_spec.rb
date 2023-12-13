require "spec_helper"
require_relative "../solutions/day7.rb"

RSpec.describe Day7 do
  describe "process" do
    let(:input) do
      <<~END
      KTJJT 220
      32T3K 765
      T55J5 684
      QQQJA 483
      KK677 28
      END
    end

    it "checks cards" do
      expect(described_class.new.process(input)).to eq 6440
    end
  end

  context "sorting" do
    let(:input) do
      <<~END
      33332 2
      2AAAA 5
      END
    end

    it "checks cards" do
      expect(described_class.new.process(input)).to eq 9
    end
  end

  context "sorting 2" do
    let(:input) do
      <<~END
      77888 2
      77788 5
      END
    end

    it "checks cards" do
      expect(described_class.new.process(input)).to eq 9
    end
  end

  context "sorting 3" do
    let(:input) do
      <<~END
      KK677 2
      KTJJT 5
      END
    end

    it "checks cards" do
      expect(described_class.new.process(input)).to eq 9
    end
  end

  context "sorting 4" do
    let(:input) do
      <<~END
      T55J5 2
      QQQJA 5
      END
    end

    it "checks cards" do
      expect(described_class.new.process(input)).to eq 12
    end
  end
end
