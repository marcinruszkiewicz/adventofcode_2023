require "pathfinding"
require 'progress_bar'
require "pp"
require "pry"

class Day11
  def process(input)
    @universe = input.split("\n").map { |l| l.split("") }

    expand_universe # expand horizontally
    @universe = @universe.transpose # rotate
    expand_universe # expand vertical rows (which are now horizontal)
    @universe = @universe.transpose # rotate back to original

    galaxies = []
    @universe.each.with_index do |line, i|
      next if line.all?(".")

      xes = line.each_with_index.select { |c, index| c == "#" }.map { |pair| pair[1] }
      xes.each { |x| galaxies << [i, x] }
    end

    galaxies_pairs = galaxies.permutation(2).to_a.uniq { |s| s.sort }
    matrix = Array.new(@universe.length + 1, Array.new(@universe[0].length + 1, 0))
    grid = Grid.new(matrix)

    total_sum = 0
    slice_size = galaxies_pairs.length / 8

    threads = []
    slice_num = 0
    bar = ProgressBar.new(galaxies_pairs.length)

    galaxies_pairs.each_slice(slice_size) do |slice|
      threads << Thread.new do
        sum = 0
        slice.each do |pair|
          # pp pair
          # puts "#{pair[0][0]}, #{pair[0][1]}"
          # puts "#{pair[1][0]}, #{pair[1][1]}"

          start_node = grid.node(pair[0][0], pair[0][1])
          end_node = grid.node(pair[1][0], pair[1][1])
          # pp start_node
          # pp end_node

          finder = AStarFinder.new()
          path = finder.find_path(start_node, end_node, grid)

          # pp path
          sum += path.length - 1
          # puts grid.to_s(path, start_node, end_node)
          bar.increment!
        end

        total_sum += sum
      end
    end
    threads.map(&:join)

    total_sum
  end

  def expand_universe
    empty = []
    @universe.each.with_index do |line, i|
      empty << i if line.all?(".")
    end

    newline = Array.new(@universe[0].length, ".")
    empty.reverse.each do |i|
      @universe.insert(i, newline)
    end
  end
end
