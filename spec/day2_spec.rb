require "spec_helper"
require_relative "../solutions/day2.rb"

RSpec.describe Day2 do
  describe "possible?" do
    it "checks if bag is possible" do
      expect(described_class.new.possible?("8 green, 6 blue, 20 red")).to eq false
      expect(described_class.new.possible?("3 blue, 4 red")).to eq true
    end
  end

  describe "game_possible?" do
    it "checks possibility of whole game" do
      expect(described_class.new.game_possible?("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")).to eq true
      expect(described_class.new.game_possible?("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue")).to eq true
      expect(described_class.new.game_possible?("Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green")).to eq true
      expect(described_class.new.game_possible?("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red")).to eq false
      expect(described_class.new.game_possible?("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red")).to eq false
    end
  end

  describe "process" do
    let(:input) do
      "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
    end

    it "processes input" do
      expect(described_class.new.process(input)).to eq 8
    end
  end
end
