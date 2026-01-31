require 'byebug'
class Node
  attr_accessor :value, :previous, :next

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end


class Queue
  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(value)
    node = Node.new(value)

    if empty?
      @head = @tail = node
    else
      @head.previous = node
      node.next = @head
      @head = node
    end
  end

  def dequeue
    #   error when empty queue
    # when last elelemt
    # reset head/tail
    # when non-last element
    # reset tail
    #

    return "Queue empty" if empty?

    node = @tail

    if @tail == @head
      @head = @tail = nil
    else
      node.previous.next = nil
      @tail = node.previous
      node.previous = nil
    end

    node.value
  end

  def read
    node = @tail
    loop do
      puts node.value
      break if node == @head
      node = node.previous
    end
  end


  def empty?
    @head.nil?
  end
end

queue = Queue.new
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.read

puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
