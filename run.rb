#! /usr/bin/env ruby

require_relative "solutions/day1"
require_relative "solutions/day2"
require_relative "solutions/day3"
require_relative "solutions/day4"
require_relative "solutions/day5"
require_relative "solutions/day6"
require_relative "solutions/day7"
require_relative "solutions/day8"
require_relative "solutions/day9"
require_relative "solutions/day10"
require_relative "solutions/day11"
require_relative "solutions/day12"

result = nil

# result = Day1.new.process(File.read("inputs/day1.txt"))
# result = Day1.new.process2(File.read("inputs/day1.txt")) # FIXME
# result = Day2.new.process(File.read("inputs/day2.txt"))
# result = Day2.new.process2(File.read("inputs/day2.txt"))
# result = Day3.new(File.read("inputs/day3.txt")).process
# result = Day4.new.process(File.read("inputs/day4.txt"))
# result = Day5.new(File.read("inputs/day5.txt")).process # kinda slow
# result = Day5.new(File.read("inputs/day5.txt")).process2 # super slow
# result = Day6.new.process(File.read("inputs/day6.txt"))
# result = Day6.new.process2(File.read("inputs/day6.txt"))
# result = Day7.new.process(File.read("inputs/day7.txt"))
# result = Day8.new.process(File.read("inputs/day8.txt"))
# result = Day9.new.process(File.read("inputs/day9.txt"))
# result = Day9.new.process2(File.read("inputs/day9.txt"))
# result = Day10.new.process(File.read("inputs/day10.txt"))
result = Day11.new.process(File.read("inputs/day11.txt"))
result = Day12.new.process(File.read("inputs/day12.txt"))

puts result
