require 'byebug'
class Node
  attr_reader :data, :priority

  def initialize(data, priority)
    @data = data
    @priority = priority
  end
end


class PriorityQueue
  def initialize
    @values = []
  end

  def add(data, priority)
    node = Node.new(data, priority)
    @values << node

    node_index = @values.size - 1
    parent_index = (node_index - 1) % 2
    parent_node = @values[parent_index]

    while node_index > 0 && node.priority > parent_node.priority
      tmp = @values[parent_index]
      @values[parent_index] = node
      @values[node_index] = tmp

      node = @values[node_index]
      parent_node = @values[parent_index]

      node_index = parent_index
      parent_index = (node_index - 1) % 2
    end
  end

  def read
    @values.map(&:priority)
  end
end

queue = PriorityQueue.new

queue.add 200, 10
queue.add 300, 20
queue.add 100, 30
queue.add 30, 40
queue.add 80, 50

puts queue.read

