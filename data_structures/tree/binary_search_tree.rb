require 'byebug'
require_relative '../queue.rb'
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def add(value)
    node = Node.new(value)

    return @root = node if @root.nil?

    add_node(node, @root)
  end

  def delete(value)
    #   find node to delete
    # find if needs to replace with successor
    # find successor
    # update successor pointers
    #   50
    #   /  \
    #    30    70
    #   /  \   / \
    # 20   40 60  80
    #
    node = @root

    if (value < @root.value)
      node = node.left
    elsif (value > @root.value)
      node = node.right
    else
      if (node.right)

        while (node.right) do
          previous = node.right

        end
      end

    end


  end

  def bfs
    result = []

    return result if empty?
    node_queue = Queue.new

    node_queue.enqueue(@root)

    until (node_queue.empty?) do
      node = node_queue.dequeue
      result << node.value
      node_queue.enqueue(node.left) if node.left
      node_queue.enqueue(node.right) if node.right
    end
    result
  end

  def dfs_in_order
    return [] if empty?

    traverse_in_order(@root)
  end

  def dfs_pre_order
    return [] if empty?

    traverse_pre_order(@root)
  end

  def dfs_post_order
    return [] if empty?

    traverse_post_order(@root)
  end

  private

  def traverse_in_order(node, result= [])
    traverse_in_order(node.left, result) if node.left
    result << node.value
    traverse_in_order(node.right, result) if node.right

    result
  end

  def traverse_pre_order(node, result= [])
    result << node.value
    traverse_pre_order(node.left, result) if node.left
    traverse_pre_order(node.right, result) if node.right

    result
  end

  def traverse_post_order(node, result= [])
    traverse_post_order(node.left, result) if node.left
    traverse_post_order(node.right, result) if node.right
    result << node.value

    result
  end

  def empty?
    @root.nil?
  end


  def add_node(node, parent)
    if (node.value < parent.value)
      if (parent.left)
        add_node(node, parent.left)
      else
        parent.left = node
      end
    else
      if (parent.right)
        add_node(node, parent.right)
      else
        parent.right = node
      end
    end
  end
end

tree = BinarySearchTree.new
# tree.add(10)
# tree.add(5)
# tree.add(15)
# tree.add(25)
# tree.add(13)
# tree.add(50)
# tree.add(12)
# tree.add(34)

tree.add(50);
tree.add(60);
tree.add(45);
tree.add(67);
tree.add(23);
tree.add(25);

puts "bfs - #{tree.bfs}"
puts "dfs - in_order - #{tree.dfs_in_order}"
puts "dfs - pre_order - #{tree.dfs_pre_order}"
puts "dfs - post_order - #{tree.dfs_post_order}"


# tree.delete(13)
# tree.delete(50)
# tree.delete(10)
