require "spec_helper"
require_relative "../solutions/day16.rb"

RSpec.describe Day16 do
  describe "process" do
    let(:input) do
      <<~END
      END
    end

    it "does things" do
      expect(described_class.new.process(input)).to eq 1234
    end
  end
end
