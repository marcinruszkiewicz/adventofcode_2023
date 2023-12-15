require "pp"

class Day15
  def process(input)
    seqs = input.split(",")

    sum = 0
    seqs.each do |seq|
      val = algo(seq.strip)
      sum += val
    end

    sum
  end

  def algo(seq)
    val = 0
    seq.split("").each do |c|
      val += c.ord
      val = val * 17
      val = val % 256
    end

    val
  end
end
