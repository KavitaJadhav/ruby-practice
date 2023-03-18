require 'byebug'

class Node
  attr_accessor :right, :left, :value

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
    node = Node.new value

    if @root
      add_child(@root, node)
    else
      @root = node
    end
  end

  def search(value)
    current_node = @root

    while current_node do
      return true if current_node.value == value

      if current_node.value > value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end

    false
  end


  def bfs
    data = []
    queue = []

    return data unless @root

    queue << @root
    while !queue.empty?
      node = queue.shift
      data << node.value
      queue << node.left if node.left
      queue << node.right if node.right
    end
    data
  end

  def preorder_dfs
    data = []

    inorder_read(@root, data)
  end

  def preorder_dfs1(node = nil, data = [])
    node = node || @root

    data << node.value
    if node.left
      preorder_dfs1 node.left, data
    end

    if node.right
      preorder_dfs1 node.right, data
    end

    data
  end

  def postorder_dfs1(node= nil, data= [])
    node = node || @root

    if node.left
      postorder_dfs1 node.left, data
    end

    if node.right
      postorder_dfs1 node.right, data
    end

    data << node.value

    data
  end

  def inorder_dfs1(node= nil, data= [])
    node = node || @root

    if node.left
      inorder_dfs1 node.left, data
    end

    data << node.value

    if node.right
      inorder_dfs1 node.right, data
    end

    data
  end

  private

  def inorder_read node, data
    data << node.value
    if node.left
      inorder_read node.left, data
    end

    if node.right
      inorder_read node.right, data
    end

    data
  end

  def add_child parent, node
    right = parent.right
    left = parent.left

    if node.value > parent.value
      right ? add_child(right, node) : parent.right = node
    else
      left ? add_child(left, node) : parent.left = node
    end
  end
end

tree = BinarySearchTree.new
tree.add 30
tree.add 40
tree.add 35
tree.add 10
tree.add 37
tree.add 48


# tree.add 10
# tree.add 6
# tree.add 3
# tree.add 8
# tree.add 15
# tree.add 20


# puts tree.search 45
# puts tree.bfs
# puts tree.preorder_dfs
# puts '-----------------'
# puts tree.preorder_dfs1
# puts '-----------------'
# puts tree.postorder_dfs1
puts '-----------------'
puts tree.inorder_dfs1


#        30
#   10       40
#       35        48
#         37
#
# 30, 10, 40, 35, 37, 48-pre
# 10, 35, 37, 48, 40, 30-post
# 10, 30, 35, 37, 40, 48 - in
#


