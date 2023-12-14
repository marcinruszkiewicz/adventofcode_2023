require "spec_helper"
require_relative "../solutions/day10.rb"

RSpec.describe Day10 do
  describe "process" do
    let(:input) do
      <<~END
     .....
     .S-7.
     .|.|.
     .L-J.
     .....
      END
    end
    let(:input2) do
      <<~END
      -L|F7
      7S-7|
      L|7||
      -L-J|
      L|-JF
      END
    end
    let(:input3) do
      <<~END
     ..F7.
     .FJ|.
     SJ.L7
     |F--J
     LJ...
      END
    end
    let(:input4) do
      <<~END
      7-F7-
      .FJ|7
      SJLL7
      |F--J
      LJ.LJ
      END
    end

    it "calculates max distance" do
      expect(described_class.new.process(input)).to eq 4
      expect(described_class.new.process(input2)).to eq 4
      expect(described_class.new.process(input3)).to eq 8
      expect(described_class.new.process(input4)).to eq 8
    end
  end
end
