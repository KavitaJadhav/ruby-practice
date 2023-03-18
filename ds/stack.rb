require '../ds/singly_linked_list'

class Stack
  def initialize
    @queue = SinglyLinkedList.new
  end

  def push(data)
    @queue.add(data)
  end

  def pop
    @queue.pop
  end

  def read
    @queue.read
  end
end

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.pop
puts stack.read