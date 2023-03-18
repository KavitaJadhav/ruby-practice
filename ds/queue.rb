require '../ds/singly_linked_list'

class Queue
  def initialize
    @queue = SinglyLinkedList.new
  end

  def enqueue(data)
    @queue.add(data)
  end

  def dequeue
    @queue.delete(0)
  end

  def read
    @queue.read
  end
end

queue = Queue.new
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.dequeue
puts queue.read