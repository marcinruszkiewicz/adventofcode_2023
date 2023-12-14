require "spec_helper"
require_relative "../solutions/day11.rb"

RSpec.describe Day11 do
  describe "process" do
    let(:input) do
      <<~END
      ...#......
      .......#..
      #.........
      ..........
      ......#...
      .#........
      .........#
      ..........
      .......#..
      #...#.....
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 374
    end
  end
end
