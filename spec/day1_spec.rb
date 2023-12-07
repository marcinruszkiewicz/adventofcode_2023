require "spec_helper"
require_relative "../solutions/day1.rb"

RSpec.describe Day1 do
  describe "calibrate" do
    it "returns only numbers" do
      expect(described_class.new.calibrate("1abc2")).to eq 12
      expect(described_class.new.calibrate("pqr3stu8vwx")).to eq 38
      expect(described_class.new.calibrate("a1b2c3d4e5f")).to eq 15
      expect(described_class.new.calibrate("treb7uchet")).to eq 77
    end
  end

  describe "calibrate2" do
    it "returns with words as numbers" do
      expect(described_class.new.calibrate2("1abc2")).to eq 12
      expect(described_class.new.calibrate2("pqr3stu8vwx")).to eq 38
      expect(described_class.new.calibrate2("a1b2c3d4e5f")).to eq 15
      expect(described_class.new.calibrate2("treb7uchet")).to eq 77

      expect(described_class.new.calibrate2("two1nine")).to eq 29
      expect(described_class.new.calibrate2("eightwothree")).to eq 83
      expect(described_class.new.calibrate2("abcone2threexyz")).to eq 13
      expect(described_class.new.calibrate2("xtwone3four")).to eq 24
      expect(described_class.new.calibrate2("4nineeightseven2")).to eq 42
      expect(described_class.new.calibrate2("zoneight234")).to eq 14
      expect(described_class.new.calibrate2("7pqrstsixteen")).to eq 76

      expect(described_class.new.calibrate2("ninesevensrzxkzpmgz8kcjxsbdftwoner")).to eq 92
      expect(described_class.new.calibrate2("42")).to eq 42
      expect(described_class.new.calibrate2("oneeight8two7eight")).to eq 18
      expect(described_class.new.calibrate2("8twoonesevenone")).to eq 81
    end

    it "solves doubles" do
      expect(described_class.new.calibrate2("6oneight")).to eq 68
    end
  end

  describe "process" do
    let(:input) do
      "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"
    end

    it "processes input" do
      expect(described_class.new.process(input)).to eq 142
    end
  end

    describe "process2" do
      let(:input) do
        "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"
      end

      it "processes input" do
        expect(described_class.new.process2(input)).to eq 281
      end
    end
end
