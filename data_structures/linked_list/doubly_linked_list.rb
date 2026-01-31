require 'byebug'

class Node
  attr_accessor :value, :next, :previous

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end

class DoublyLinkedList
  attr_reader :size

  def initialize
    @size = 0
  end

  def push(value)
    node = Node.new(value)

    if empty?
      @head = @tail = node
    else
      node.previous = @tail
      @tail.next = node

      @tail = node
    end


    @size = @size.next
  end

  def read
    return if empty?
    node = @head

    loop do
      puts node.value
      break if node == @tail
      node = node.next
    end
  end

  def pop
    node = @tail
    if size == 1
      reset_list
    else
      @tail = node.previous
      @tail.next = nil
      node.previous = nil
    end

    @size = @size.pred
    node.value
  end


  def shift
    return if empty?

    node = @head
    if @size == 1
      reset_list
    else
      @head = node.next
      @head.previous = nil
      node.next = nil
    end

    @size = @size.pred
    node.value
  end

  def unshift(value)
    return push(value) if empty?

    node = Node.new(value)
    node.next = @head
    @head.previous = node
    @head = node

    @size = @size.next
  end

  def insert(index, value)
    return 'invalid index' if index > @size

    return unshift(value) if index == 0
    return push(value) if index == @size

    node = Node.new(value)

    node_at_index = @head
    index.times do
      node_at_index = node_at_index.next
    end

    node.next = node_at_index
    node.previous = node_at_index.previous

    node_at_index.previous.next = node
    node_at_index.previous = node

    @size = @size.next
  end

  def delete(index)
    return 'invalid index' if index > @size

    return shift if index == 0
    return pop if index == @size - 1

    node_at_index = @head
    index.times do
      node_at_index = node_at_index.next
    end

    previous_node = node_at_index.previous
    next_node = node_at_index.next

    previous_node.next = node_at_index.next
    next_node.previous = node_at_index.previous

    node_at_index.previous = nil
    node_at_index.next = nil

    @size = @size.pred

    node_at_index.value
  end

  private

  def reset_list
    @head = @tail = nil
  end

  def empty?
    @size == 0
  end
end

linked_list = DoublyLinkedList.new
# linked_list.push(10)
# linked_list.push(20)
# linked_list.read
# # 10, 20
# puts linked_list.size
# # 1
#
#
# puts linked_list.pop
# puts linked_list.pop
# linked_list.read
# # no elements
# puts linked_list.size
# # 1

# linked_list.push(10)
# linked_list.push(20)
# puts linked_list.shift
# linked_list.read
# # 20
# puts linked_list.size
# # 1

#
# linked_list.unshift(50)
# linked_list.unshift(60)
# linked_list.read
# # 60, 50
# puts linked_list.size
# # 2

#
# linked_list.insert(0, 1)
# # 2
# linked_list.insert(0, 2)
# # 2, 1
# linked_list.insert(1, 3)
# # 2,3, 1
# puts linked_list.insert(5, 5) #Print error
# linked_list.read
# # 2,3, 1
# puts linked_list.size
# #
#

# linked_list.push(10)
# linked_list.push(20)
# linked_list.push(30)
# # 10, 20, 30
#
# puts linked_list.delete(5) #print error
# puts linked_list.delete(1)
# # 20
#
# puts linked_list.delete(1)
# # 30
# puts linked_list.delete(0)
# 10

# delete(index)
