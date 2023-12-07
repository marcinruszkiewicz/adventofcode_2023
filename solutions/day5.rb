class Day5
  attr_reader :seeds, :seed_to_soil, :soil_to_fertilizer, :fertilizer_to_water, :water_to_light,
    :light_to_temperature, :temperature_to_humidity, :humidity_to_location

  def initialize(input)
    input.tr("-", "_").split("\n\n").each do |section|
      type, data = section.split(":")
      type = type.gsub(" map", "")

      if type == "seeds"
        @seeds = data.split(" ").map(&:to_i)
      else
        data = data.split("\n").reject(&:empty?)

        valid_ranges = []
        data.each do |ranges|
          nums = ranges.scan(/\d+/).map(&:to_i)
          str = {
            "destination_range": Range.new(nums[1], nums[1]+nums[2]-1),
            "source_range": Range.new(nums[0], nums[0]+nums[2]-1)
          }

          valid_ranges << str
        end

        instance_variable_set("@#{type}", valid_ranges)
      end

    end
  end

  def process

  end
end