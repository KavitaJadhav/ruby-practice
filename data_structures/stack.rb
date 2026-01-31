class Node
  attr_accessor :value, :previous, :next

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end


class Stack
  def initialize
    @top = nil
  end

  def push(value)
    node = Node.new(value)
    if @top
      @top.next = node
      node.previous = @top
      @top = node
    else
      @top = node
    end
  end

  def pop
    return "empty stack" if empty?
    node = @top

    @top = @top.previous
    if @top
      @top.next = nil
      node.previous = nil
    end

    node.value
  end

  def read
    node = @top
    while (node) do
      puts node.value
      node = node.previous
    end
  end

  private

  def empty?
    @top.nil?
  end

end

stack = Stack.new

stack.push(10)
stack.push(20)
stack.push(30)
stack.read

#
puts stack.pop
puts stack.pop
puts stack.pop
puts stack.pop
#
stack.read
#
# stack.top
# stack.peek

