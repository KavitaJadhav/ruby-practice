require 'byebug'
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class SingalyLinkedList
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(value)
    node = Node.new(value)
    if present?
      @tail.next = node
      @tail = node
    else
      @head = @tail = node
    end

    @length = @length.next
  end

  def read
    return unless @head
    node = @head

    loop do
      puts node.value
      break if node == @tail
      node = node.next
    end
  end

  def shift
    return unless @head
    node = @head

    if empty?
      @head = @tail = nil
    else
      @head = node.next
    end

    @length = @length.pred

    return node.value
  end

  def unshift(value)
    if empty?
      return push(value)
    end

    node = Node.new(value)
    node.next = @head
    @head = node
    @length = @length.next
  end

  def insert(index, value)
    return 'Error' if index > @length

    return unshift(value) if index == 0
    return push(value) if index == @length - 1

    # 1,2,3,4,5
    # index 2, 10 value
    # 1,2,10,3,4,5

    current_node = @head
    previous_node = nil
    index.times do
      previous_node = current_node
      current_node = current_node.next
    end


    new_node = Node.new(value)
    previous_node.next = new_node
    new_node.next = current_node
  end

  def size
    @length
  end

  private

  def empty?
    @length == 0
  end

  def present?
    !empty?
  end
end

linked_list = SingalyLinkedList.new
linked_list.push(10)
linked_list.push(20)
linked_list.push(30)
# linked_list.read
#10, 20, 30
#

puts linked_list.shift
puts linked_list.shift
puts linked_list.shift
puts "------------read------"
linked_list.push(40)
# linked_list.read


puts linked_list.size

linked_list.unshift(10)
linked_list.unshift(20)
puts "------------read------"
# linked_list.read
# 20, 10, 40,

linked_list.insert(1, 50)
linked_list.insert(0, 60)
linked_list.insert(0, 60)
puts "------------read------"
linked_list.read
# 60, 20, 50, 10, 40


# remove
# search
# get(index)
# insert(index, value)