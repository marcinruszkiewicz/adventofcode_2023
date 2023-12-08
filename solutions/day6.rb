class Day6
  attr_reader :times, :distances

  def process(input)
    @times = input.split("\n").first.scan(/\d+/).map(&:to_i)
    @distances = input.split("\n").last.scan(/\d+/).map(&:to_i)

    races = []

    times.each.with_index do |time, ind|
      split_races = []
      (0..time).each do |seconds|
        if beat_record?(seconds, time, distances[ind])
          split_races << seconds
        end
      end
      # puts "split results for #{time}: #{split_races.inspect}"
      races << split_races.length
    end

    # puts races.inspect

    races.reject(&:zero?).inject(:*)
  end

  def process2(input)
    @times = input.split("\n").first.scan(/\d+/).join.to_i
    @distances = input.split("\n").last.scan(/\d+/).join.to_i

    races = []
    (0..times).each do |seconds|
      if beat_record?(seconds, times, distances)
        races << seconds
      end
    end

    races.length
  end

  def beat_record?(seconds, max_time, record)
    runtime = max_time-seconds
    distance_traveled = runtime * seconds

    distance_traveled > record
  end
end