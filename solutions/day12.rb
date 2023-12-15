require "pp"
require "progress_bar"

class Day12
  def process(input)
    lines = input.split("\n")

    bar = ProgressBar.new(lines.length)

    sum = 0
    lines.each do |line|
      symbols, sizes = line.split(" ")
      sizes = sizes.split(",").map(&:to_i)

      incomplete = [symbols]
      complete = []

      while incomplete.length > 0
        current = incomplete.shift

        [current.sub("?", "."), current.sub("?", "#")].each do |opt|
          if opt.include?("?")
            incomplete << opt
          elsif opt.split(".").reject(&:empty?).map(&:length) == sizes
            complete << opt
          end
        end
      end

      sum += complete.length
      bar.increment!
    end

    sum
  end

  def process2(input)
    lines = input.split("\n")

    bar = ProgressBar.new(lines.length)

    sum = 0
    lines.each do |line|
      symbols, sizes = line.split(" ")
      sizes = sizes.split(",").map(&:to_i) * 5
      symbols = ([symbols] * 5).join("?")

      incomplete = [symbols]
      complete = []

      while incomplete.length > 0
        current = incomplete.shift

        [current.sub("?", "."), current.sub("?", "#")].each do |opt|
          if opt.include?("?")
            incomplete << opt
          elsif opt.split(".").reject(&:empty?).map(&:length) == sizes
            complete << opt
          end
        end
      end

      sum += complete.length
      bar.increment!
    end

    sum
  end
end
