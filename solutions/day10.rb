require "pp"

class Day10
  attr_reader :field, :results, :last_x, :last_y, :last_from

  def process(input)
    lines = input.split("\n")
    @field = lines.map { |l| l.split("") }
    @results = []
    @last_x = nil
    @last_y = nil
    @last_from = nil

    (0..lines.length - 1).each do |y|
      @results[y] = []

      (0..@field[0].length - 1).each do |x|
        @results[y] << nil
      end
    end

    starting_point_y = lines.find_index { |l| l.include?("S") }
    starting_point_x = @field[starting_point_y].find_index("S")
    @results[starting_point_y][starting_point_x] = 0

    # pp @field
    # pp @results

    begin
      check_first(starting_point_y, starting_point_x)
    rescue SystemStackError
      puts "[#{last_y}, #{last_x}] - #{last_from}"
      check_surroundings(last_y, last_x, last_from)
    end
    # @results.each{ |l| pp l}

    (@results.flatten.map(&:to_i).max + 1) / 2
  end

  def check_first(y, x)
    step = @results[y][x] == nil ? 1 : @results[y][x] + 1
    # puts "checking surroundings for #{step}, [#{y}, #{x}]"

    if move_north?(y, x)
      point_y = (y - 1).clamp(0, @field.length - 1)
      point_x = x

      # puts "N: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "S")
        check_surroundings(point_y, point_x, "S")
      end

    return
    end

    if move_south?(y, x)
      point_y = (y + 1).clamp(0, @field.length - 1)
      point_x = x

      # puts "S: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "N")
        check_surroundings(point_y, point_x, "N")
      end

    return
    end

    if move_east?(y, x)
      point_y = y
      point_x = (x + 1).clamp(0, @field[y].length - 1)

      # puts "E: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "W")
        check_surroundings(point_y, point_x, "W")
      end

    return
    end

    if move_west?(y, x)
      point_y = y
      point_x = (x - 1).clamp(0, @field[y].length - 1)

      # puts "W: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "E")
        check_surroundings(point_y, point_x, "E")
      end
    return
    end
  end

  def check_surroundings(y, x, from)
    step = @results[y][x] == nil ? 1 : @results[y][x] + 1
    # puts "checking surroundings for #{step}, [#{y}, #{x}]"

    if from != "N" && move_north?(y, x)
      point_y = (y - 1).clamp(0, @field.length - 1)
      point_x = x

      # puts "N: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "S")
        check_surroundings(point_y, point_x, "S")
      end
    end

    if from != "S" && move_south?(y, x)
      point_y = (y + 1).clamp(0, @field.length - 1)
      point_x = x

      # puts "S: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "N")
        check_surroundings(point_y, point_x, "N")
      end
    end

    if from != "E" && move_east?(y, x)
      point_y = y
      point_x = (x + 1).clamp(0, @field[y].length - 1)

      # puts "E: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "W")
        check_surroundings(point_y, point_x, "W")
      end
    end

    if from != "W" && move_west?(y, x)
      point_y = y
      point_x = (x - 1).clamp(0, @field[y].length - 1)

      # puts "W: [#{y}, #{x}]"

      unless @results[point_y][point_x] == 0
        mark_result(point_y, point_x, step, "E")
        check_surroundings(point_y, point_x, "E")
      end
    end
  end

  def mark_result(y, x, step, from)
    puts "marking #{step}, [#{y}, #{x}]"
    @results[y][x] = step
    @last_x = x
    @last_y = y
    @last_from = from
    # puts @results[y].inspect
    # @results.each{ |l| pp l}
  end

  def move_north?(y, x)
    return false if y == 0
    from = @field[y][x]
    return false if ["-", "F", "7"].include?(from)

    point_y = (y - 1).clamp(0, @field.length - 1)
    point_x = x

    case @field[point_y][point_x]
    when "7"
      return true
    when "F"
      return true
    when "|"
      return true
    else
      return false
    end
  end

  def move_south?(y, x)
    return false if y == @field.length - 1
    from = @field[y][x]
    return false if ["-", "L", "J"].include?(from)

    point_y = (y + 1).clamp(0, @field.length - 1)
    point_x = x


    case @field[point_y][point_x]
    when "L"
      return true
    when "J"
      return true
    when "|"
      return true
    else
      return false
    end
  end

  def move_west?(y, x)
    return false if x == 0
    from = @field[y][x]
    return false if ["|", "L", "F"].include?(from)


    point_y = y
    point_x = (x - 1).clamp(0, @field[y].length - 1)

    case @field[point_y][point_x]
    when "L"
      return true
    when "F"
      return true
    when "-"
      return true
    else
      return false
    end
  end

  def move_east?(y, x)
    return false if x == @field[y].length - 1
    from = @field[y][x]
    return false if ["|", "7", "J"].include?(from)

    point_y = y
    point_x = (x + 1).clamp(0, @field[y].length - 1)

    case @field[point_y][point_x]
    when "7"
      return true
    when "J"
      return true
    when "-"
      return true
    else
      return false
    end
  end
end
