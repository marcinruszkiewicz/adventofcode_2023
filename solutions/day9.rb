require "pp"

class Day9
  def process(input)
    dataset = input.split("\n")

    sum = 0

    dataset.each do |line|
      matrix = []
      matrix << line.split(" ").map(&:to_i)

      loop do
        previous = matrix.last

        line = []
        (1..previous.length - 1).each do |i|
          line << previous[i] - previous[i - 1]
        end

        matrix << line
        break if line.all?(&:zero?)
      end
      matrix.reverse!

      matrix.each.with_index do |line, i|
        if line.all?(&:zero?)
          matrix[i] << 0
        else
          result = matrix[i - 1].last
          curr = matrix[i].last

          matrix[i] << result + curr
        end
      end

      sum += matrix.last.last
    end

    sum
  end

  def process2(input)
    dataset = input.split("\n")

    sum = 0

    dataset.each do |line|
      matrix = []
      matrix << line.split(" ").map(&:to_i)

      loop do
        previous = matrix.last

        line = []
        (1..previous.length - 1).each do |i|
          line << previous[i] - previous[i - 1]
        end

        matrix << line
        break if line.all?(&:zero?)
      end
      matrix.reverse!

      matrix.each.with_index do |line, i|
        if line.all?(&:zero?)
          matrix[i].insert(0, 0)
        else
          result = matrix[i - 1].first
          curr = matrix[i].first

          matrix[i].insert(0, curr - result)
        end
      end

      sum += matrix.last.first
    end

    sum
  end
end
