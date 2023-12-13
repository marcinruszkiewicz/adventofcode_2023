class Day8
  class BTree
    attr_accessor :root, :nodes

    class Node
      attr_accessor :value, :left, :right

      def initialize(data)
        @value = data
        @left = @right = nil
      end

      def to_s
        puts "#{self.value} (#{self.left}, #{self.right})"
      end
    end

    def initialize(root)
      self.root = root
      self.nodes = [root]
    end

    def insert_left(node, data)
      nnode = Node.new data

      node.left = nnode
      self.nodes << nnode
    end

    def insert_right(node, data)
      nnode = Node.new data

      node.right = nnode
      self.nodes << nnode
    end

    def find_node(data)
      self.nodes.find { |a| a.value == data }
    end

    def add_node(data)
      return if find_node(data)

      nnode = Node.new data
      self.nodes << nnode
    end
  end

  def process(input)
    instructions, data = input.split("\n\n")
    sorted = data.split("\n").sort_by { |c| c.slice(0,3) }

    aaa = sorted.shift
    m = aaa.match(/(?<data>[A-Z]+) = \((?<left>[A-Z]+), (?<right>[A-Z]+)\)/)

    anode = BTree::Node.new(m[:data])
    tree = BTree.new(anode)
    tree.insert_left(tree.root, m[:left])
    tree.insert_right(tree.root, m[:right])

    data.split("\n").sort_by { |c| c.slice(0,3) }.each do |line|
      m = line.match(/(?<data>[A-Z]+) = \((?<left>[A-Z]+), (?<right>[A-Z]+)\)/)
      tree.add_node(m[:data])
    end

    data.split("\n").sort_by { |c| c.slice(0,3) }.each do |line|
      m = line.match(/(?<data>[A-Z]+) = \((?<left>[A-Z]+), (?<right>[A-Z]+)\)/)

      node = tree.find_node(m[:data])
      node.left = tree.find_node(m[:left])
      node.right = tree.find_node(m[:right])
    end

    steps = 0
    node = tree.root
    loop do
      instructions.split("").each do |step|
        node = step == "L" ? node.left : node.right
        steps += 1
      end
      break if node.value == "ZZZ"
    end

    steps
  end
end

