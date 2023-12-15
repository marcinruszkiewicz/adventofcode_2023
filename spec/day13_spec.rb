require "spec_helper"
require_relative "../solutions/day13.rb"

RSpec.describe Day13 do
  describe "process" do
    let(:input) do
      <<~END
      #.##..##.
      ..#.##.#.
      ##......#
      ##......#
      ..#.##.#.
      ..##..##.
      #.#.##.#.

      #...##..#
      #....#..#
      ..##..###
      #####.##.
      #####.##.
      ..##..###
      #....#..#
      END
    end

    let(:input2) do
      <<~END
      ###..####.###
      .######..#...
      .######..#...
      ###..####.###
      ........##.#.
      .######.#.##.
      .#...##.....#
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 405
      expect(described_class.new.process(input2)).to eq 200
    end
  end
end
