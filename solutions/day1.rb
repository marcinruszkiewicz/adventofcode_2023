class Day1
  NUMERICS = {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  def process(input)
    num = []
    input.split("\n").each do |line|
      num << calibrate(line).to_i
    end

    num.sum
  end

  def process2(input)
    num = []
    input.split("\n").each do |line|
      num << calibrate2(line).to_i
    end

    num.sum
  end

  def calibrate(line)
    numbers = line.gsub(/[a-zA-Z]/, "").strip.split("")

    return (numbers.first.to_s + numbers.last.to_s).to_i
  end

  def calibrate2(line)
    # FIXME: needs to process shared letters correctly
    matcher = /#{NUMERICS.keys.join('|')}/
    parsed = line.gsub(matcher, NUMERICS).strip

    return calibrate(parsed)
  end
end
