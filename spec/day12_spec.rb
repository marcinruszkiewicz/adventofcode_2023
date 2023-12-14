require "spec_helper"
require_relative "../solutions/day12.rb"

RSpec.describe Day12 do
  describe "process" do
    let(:input) do
      <<~END
      ???.### 1,1,3
      .??..??...?##. 1,1,3
      ?#?#?#?#?#?#?#? 1,3,1,6
      ????.#...#... 4,1,1
      ????.######..#####. 1,6,5
      ?###???????? 3,2,1
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 21
    end
  end
end
