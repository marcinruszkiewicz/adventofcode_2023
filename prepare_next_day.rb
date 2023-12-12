#! /usr/bin/env ruby

def require_statement(num)
  "require_relative \"solutions/day#{num}\"\n"
end

def result_statement(num)
  "result = Day#{num}.new.process(File.read(\"inputs/day#{num}.txt\"))\n"
end

def spec_content(num)
  <<~SPEC
  require "spec_helper"
  require_relative "../solutions/day#{num}.rb"

  RSpec.describe Day#{num} do

  end
  SPEC
end

def solution_content(num)
  <<~CODE
  class Day#{num}
    def process

    end
  end
  CODE
end

content = File.readlines("./run.rb")

last_require = nil
last_result = nil
content.each.with_index do |line, index|
  last_require = index if line.start_with?("require_relative")
  last_result = index if line.start_with?("puts result")
end

next_day = content[last_require].scan(/\d+/).first.to_i + 1
content.insert(last_require + 1, require_statement(next_day))
content.insert(last_result, result_statement(next_day))

File.write("run.rb", content.join)
File.write("spec/day#{next_day}_spec.rb", spec_content(next_day))
File.write("solutions/day#{next_day}.rb", solution_content(next_day))
File.write("inputs/day#{next_day}.txt", "")

puts "Prepared for day #{next_day}"
