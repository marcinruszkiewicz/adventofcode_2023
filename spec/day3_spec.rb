require "spec_helper"
require_relative "../solutions/day3.rb"

RSpec.describe Day3 do
  let(:input) do
"467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."
    end
  let(:worker) { described_class.new(input) }

  describe "part_number?" do
    it "checks if valid part number" do
      expect(worker.part_number?(467, 0, 0)).to eq true
      expect(worker.part_number?(114, 0, 6)).to eq false
      expect(worker.part_number?(58, 5, 7)).to eq false
    end

    context "wtf" do
      let(:input) do
".............602.....958.....103..........703..........................$.........456.........704.........149...785.2=...........*.87...95..."
      end

      it "checks" do
        expect(worker.process).to eq 2
      end
    end
  end

  describe "process" do
    it "sums all part numbers" do
      expect(worker.process).to eq 4361
    end
  end
end
