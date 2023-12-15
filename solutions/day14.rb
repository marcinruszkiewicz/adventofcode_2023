require "pp"

class Day14
  def process(input)
    lines = input.split("\n")
    # puts lines.join("\n")
    # puts
    nlines = lines.map {|a| a.split("") }.transpose.map { |a| a.join }

    # pp nlines

    slid_lines = []
    nlines.each do |line|
      slid_lines << slide(line)
    end

    # pp slid_lines

    total = 0
    slid_lines.each do |line|
      total += count(line)
    end

    total
  end

  def slide(line)
    return line if line.scan(/\.O/).empty?

    until line.scan(/\.O/).empty?
      line = line.sub(".O", "O.")
    end

    line
  end

  def count(line)
    arr = line.split("")

    sum = 0
    arr.each.with_index do |c, i|
      if c == "O"
        sum += arr.length - i
      end
    end

    sum
  end
end
