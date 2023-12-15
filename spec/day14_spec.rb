require "spec_helper"
require_relative "../solutions/day14.rb"

RSpec.describe Day14 do
  describe "process" do
    let(:input) do
      <<~END
      O....#....
      O.OO#....#
      .....##...
      OO.#O....O
      .O.....O#.
      O.#..O.#.#
      ..O..#O..O
      .......O..
      #....###..
      #OO..#....
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 136
    end
  end

  describe "slide" do
    it "slides stones left" do
      expect(described_class.new.slide("OO.O.O..##")).to eq "OOOO....##"
      expect(described_class.new.slide(".#.O.#O...")).to eq ".#O..#O..."
    end
  end
end
