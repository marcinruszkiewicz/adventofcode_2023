require "spec_helper"
require_relative "../solutions/day6.rb"

RSpec.describe Day6 do
  describe "beat_record?" do
    it "counts if you traveled enough" do
      expect(described_class.new.beat_record?(0, 7, 9)).to eq false
      expect(described_class.new.beat_record?(1, 7, 9)).to eq false
      expect(described_class.new.beat_record?(2, 7, 9)).to eq true
      expect(described_class.new.beat_record?(3, 7, 9)).to eq true
      expect(described_class.new.beat_record?(4, 7, 9)).to eq true
      expect(described_class.new.beat_record?(5, 7, 9)).to eq true
      expect(described_class.new.beat_record?(6, 7, 9)).to eq false
      expect(described_class.new.beat_record?(7, 7, 9)).to eq false
    end
  end

  describe "process" do
    let(:input) do
"Time:      7  15   30
Distance:  9  40  200"
    end

    it "checks races" do
      expect(described_class.new.process(input)).to eq 288
    end
  end

  describe "process2" do
    let(:input) do
"Time:      7  15   30
Distance:  9  40  200"
    end

    it "checks races" do
      expect(described_class.new.process2(input)).to eq 71503
    end
  end
end
