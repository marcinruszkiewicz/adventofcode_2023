require_relative "solutions/day1"
require_relative "solutions/day2"
require_relative "solutions/day3"
require_relative "solutions/day4"
require_relative "solutions/day5"
require_relative "solutions/day6"
require_relative "solutions/day7"
require_relative "solutions/day8"

# result = Day1.new.process(File.read("inputs/day1.txt"))
# result = Day1.new.process2(File.read("inputs/day1.txt")) # FIXME
# result = Day2.new.process(File.read("inputs/day2.txt"))
# result = Day3.new(File.read("inputs/day3.txt")).process
result = Day4.new.process(File.read("inputs/day4.txt"))

puts result
