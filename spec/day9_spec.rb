require "spec_helper"
require_relative "../solutions/day9.rb"

RSpec.describe Day9 do
  describe "process" do
    let(:input) do
      <<~END
      0 3 6 9 12 15
      1 3 6 10 15 21
      10 13 16 21 30 45
      END
    end

    it "extrapolates history values" do
      expect(described_class.new.process(input)).to eq 114
    end
  end

  describe "process" do
    let(:input) do
      <<~END
      0 3 6 9 12 15
      1 3 6 10 15 21
      10 13 16 21 30 45
      END
    end

    it "extrapolates backwards" do
      expect(described_class.new.process2(input)).to eq 2
    end
  end
end
