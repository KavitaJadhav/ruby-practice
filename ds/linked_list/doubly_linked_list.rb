require 'byebug'

class DoublyLinkList
  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      last_node = @tail
      last_node.next = node
      node.previous = last_node
      @tail = node
    end
  end

  def pop
    return if @tail.nil?
    node_to_pop = @tail

    if @tail == @head
      @tail = nil
      @head = nil
    else
      @tail = node_to_pop.previous
      @tail.next = nil
      node_to_pop.previous = nil
    end
    node_to_pop.value
  end

  def shift
    return if @head.nil?

    node_to_shift = @head
    @head = @head.next

    if @head.nil?
      @tail = nil
    else
      @head.previous = nil?
      node_to_shift.next = nil?
    end

    node_to_shift.value
  end

  def unshift(value)
    if @head.nil?
      push(value)
    else
      node = Node.new(value)
      node.next = @head
      @head.previous = node
      @head = node
    end
  end

  def insert index, value
    unshift(value) && return if index == 0

    i = 1
    node_at_index = @head
    while i != index
      node_at_index = node_at_index.next
      i += 1
    end

    push(value) && return if node_at_index == @tail

    node = Node.new(value)
    node_at_index.previous.next = node
    node.previous = node_at_index.previous
    node.next = node_at_index
    puts node.value

    node_at_index.previous = node
  end

  def remove(index)
    node_at_index = @head
    i = 0
    while i != index
      node_at_index = node_at_index.next
      i += 1
    end

    shift && return if node_at_index == @head
    pop && return if node_at_index == @tail

    previous_mode = node_at_index.previous
    next_node = node_at_index.next

    previous_mode.next = next_node
    next_node.previous = previous_mode

    node_at_index.next = nil
    node_at_index.previous = nil
  end

  def read
    node = @head

    while node
      puts node.value
      node = node.next
    end
  end
end


class Node
  attr_accessor :next, :previous
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end


list = DoublyLinkList.new
list.push(10)
list.push(20)
list.push(30)
list.push(40)
# puts(list.pop)
# puts(list.shift)
# list.unshift(40)
# list.unshift(50)
# list.insert(3, 60)
list.remove(3)
puts 'printing list'
list.read