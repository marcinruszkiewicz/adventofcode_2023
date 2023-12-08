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
            "source_range": Range.new(nums[1], nums[1] + nums[2] - 1),
            "destination_range": Range.new(nums[0], nums[0] + nums[2] - 1)
          }

          valid_ranges << str
        end

        instance_variable_set("@#{type}", valid_ranges)
      end
    end
  end

  def process2
    locations = []

    ranges = seeds.each_slice(2).map { |start, range| Range.new(start, start+range-1) }

    ranges.each do |range|
      range.each do |seed|
        soil = get_destination(:seed_to_soil, seed)
        fertilizer = get_destination(:soil_to_fertilizer, soil)
        water = get_destination(:fertilizer_to_water, fertilizer)
        light = get_destination(:water_to_light, water)
        temperature = get_destination(:light_to_temperature, light)
        humidity = get_destination(:temperature_to_humidity, temperature)
        location = get_destination(:humidity_to_location, humidity)

        locations << location
      end
    end

    return locations.min
  end

  def process
    locations = []
    seeds.each do |seed|
      soil = get_destination(:seed_to_soil, seed)
      fertilizer = get_destination(:soil_to_fertilizer, soil)
      water = get_destination(:fertilizer_to_water, fertilizer)
      light = get_destination(:water_to_light, water)
      temperature = get_destination(:light_to_temperature, light)
      humidity = get_destination(:temperature_to_humidity, temperature)
      location = get_destination(:humidity_to_location, humidity)

      locations << location
    end

    return locations.min
  end

  def get_destination(type, source)
    data = instance_variable_get("@#{type}")

    selected_range = nil
    data.each.with_index do |set, ind|
      if set[:source_range].include?(source)
        selected_range = ind
        # puts set.inspect
      end
    end

    print "."
    if selected_range == nil
      return source
    else
      # puts data[selected_range][:source_range].to_a.inspect
      rind = data[selected_range][:source_range].find_index(source)
      # puts "#{source} at #{rind}"
      # puts data[selected_range][:destination_range].to_a.inspect
      # puts data[selected_range][:destination_range].to_a[rind]

      return data[selected_range][:destination_range].to_a[rind]
    end
  end
end