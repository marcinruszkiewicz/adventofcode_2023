require "pp"

class Day13
  def process(input)
    patterns = input.split("\n\n")

    s = 0
    patterns.each do |pt|
      lines = pt.split("\n")

      vert = vertical_reflection(lines)
      # print_vert(lines.dup, vert)
      s += vert.sum

      lm = lines.map { |l| l.split("") }.transpose.map(&:join)
      horiz = vertical_reflection(lm)
      # print_horiz(lines.dup, horiz)
      s += horiz.map { |a| a * 100 }.sum
    end

    s
  end

  def vertical_reflection(lines)
    results = []

    (0..lines[0].length-2).each do |i|
      line_reflections = []
      other_reflections = []

      lines.each do |line|
        left = line[0..i]
        right = line[i+1..-1]

        # puts "#{line} -> #{left}|#{right} #{left.reverse.start_with?(right)} || #{right.start_with?(left.reverse)}"
        line_reflections << left.reverse.start_with?(right)
        other_reflections << right.start_with?(left.reverse)
      end
      # puts "reflections for column #{i}"
      # pp line_reflections

      results << i + 1 if line_reflections.all?(true) || other_reflections.all?(true)
    end

    # if results.length == 0
    #   puts lines.join("\n")
    #   puts
    # end

    return results
  end

  def print_vert(lines, vertical)
    vertical.each do |v|
      puts "vert: #{v}"
      label = (1..lines[0].length).to_a.map { |a| a % 10 }.join
      refl = " " * (v - 1) + "><"

      lines.insert(0, refl)
      lines.insert(0, label)
      lines.insert(lines.length, refl)
      lines.insert(lines.length, label)

      puts lines.join("\n")
    end
  end

  def print_horiz(lines, horiz)
    horiz.each do |h|
      puts "horiz: #{h}"
      nlines = []

      lines.each.with_index do |line, i|
        n = i + 1
        if n == h
          nlines << "#{n}v#{line}v#{n}"
        elsif n == h+1
          nlines << "#{n}^#{line}^#{n}"
        else
          nlines << "#{n} #{line} #{n}"
        end
      end

      puts nlines.join("\n")
    end
  end
end
