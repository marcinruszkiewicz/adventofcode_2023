class Day4
  def calculate(card)
    valid, numbers = card.split("|")
    valid = valid.scan(/\d+/).map(&:to_i)
    numbers = numbers.scan(/\d+/).map(&:to_i)
    intersect = valid & numbers

    # puts valid.inspect
    # puts numbers.inspect
    # puts intersect.inspect

    return 0 if intersect.length.zero?
    return 1 if intersect.length == 1

    points = 1
    (2..intersect.length).each do
      points = points * 2
    end

    return points
  end

  def process(input)
    num = []
    input.split("\n").each do |line|
      _, points = line.split(":")
      num << calculate(points)
    end

    num.sum
  end
end
