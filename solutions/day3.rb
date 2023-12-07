class Day3
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def part_number?(number, line, pos)
    # pos = input[line].index(number.to_s)

    min = (pos - 1).clamp(0, input[line].length)
    max = (pos + number.to_s.length).clamp(0, input[line].length)

    surrounding = []
    surrounding << input[line - 1][min..max] unless line == 0
    surrounding << input[line][min] unless min == pos
    surrounding << input[line][max] unless max == input[line].length
    surrounding << input[line + 1][min..max] unless line + 1 == input.length

    # if surrounding.join.tr(".", "").gsub(/\d/, '').length == 0
    #   puts input[line - 1][min..max] unless line == 0
    #   puts input[line][min..max]
    #   puts input[line][min] unless min == pos
    #   puts input[line][max] unless max == input[line].length
    #   puts input[line + 1][min..max] unless line + 1 == input.length
    #   puts "scrub: |#{surrounding.join.tr(".", "").gsub(/\d/, '')}|"
    # end

    surrounding.join.tr(".", "").gsub(/\d/, '').length > 0
  end

  def process
    nums = []

    input.each.with_index do |line, ind|
      m = line.scan(/\d+/)
      n = line.to_enum(:scan, /\d+/).map { Regexp.last_match }
      # puts m.inspect
      # puts n.inspect
      # n.each do |md|
      #   puts "#{md[0]} - #{md.begin(0)}"
      # end

      n.each do |md|
        if part_number?(md[0].to_i, ind, md.begin(0))
          nums << md[0].to_i
        else
          # puts "expect(worker.part_number?(#{md[0]}, #{ind}, #{md.begin(0)})).to eq false"
        end
      end
    end

    nums.sum
  end
end
