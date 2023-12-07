class Day2
  LIMITS = [12, 13, 14] # red, green, blue

  def possible?(bag)
    # 8 green, 6 blue, 20 red -> [20, 8, 6]
    m = bag.match(/(?<green>\d+) green/)
    green = m == nil ? 0 : m[:green]
    m = bag.match(/(?<blue>\d+) blue/)
    blue = m == nil ? 0 : m[:blue]
    m = bag.match(/(?<red>\d+) red/)
    red = m == nil ? 0 : m[:red]

    contents = [red, green, blue]

    validated = contents.map.with_index do |k, i|
      k.to_i <= LIMITS[i]
    end

    return validated.all?(true)
  end

  def game_possible?(line)
    bags = line.split(";")

    valid_bags = bags.map do |bag|
      possible?(bag)
    end

    return valid_bags.all?(true)
  end

  def process(input)
    num = []
    input.split("\n").each do |line|
      if game_possible?(line)
        gnum = line.match(/Game (?<game>\d+):/)
        num << gnum[:game].to_i
      end
    end

    num.sum
  end
end