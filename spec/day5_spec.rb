require "spec_helper"
require_relative "../solutions/day5.rb"

RSpec.describe Day5 do
  let(:input) do
"seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"
  end
  let(:worker) { described_class.new(input) }

  describe "initialize" do
    it "reads the almanac" do
      expect(worker.seeds).to eq [79, 14, 55, 13]
      expect(worker.humidity_to_location).to eq [
        {
          source_range: 56..92,
          destination_range: 60..96
        },
        {
          source_range: 93..96,
          destination_range: 56..59
        }
      ]
    end
  end

  describe "get_destination" do
    it "returns proper value" do
      expect(worker.get_destination(:seed_to_soil, 10)).to eq 10
      expect(worker.get_destination(:seed_to_soil, 98)).to eq 50
      expect(worker.get_destination(:seed_to_soil, 99)).to eq 51
    end
  end

  describe "process" do
    it "returns location" do
      expect(worker.process).to eq 35
    end
  end

  describe "process2" do
    it "returns location" do
      expect(worker.process2).to eq 46
    end
  end
end
