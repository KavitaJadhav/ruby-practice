class SinglyLinkedList
  attr_accessor :head, :tail

  def add(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def add_at(index, value)
    node = Node.new(value)

    if index == 0
      node.next = @head
      @head = node
      return
    end

    current_node = @head
    previous_node = nil
    i = 1
    while i <= index
      previous_node = current_node
      current_node = current_node.next
      i = i + 1
    end

    @tail = node if previous_node == @tail

    node.next = current_node
    previous_node.next = node
  end

  def delete(index)
    return false if @head.nil?
    node = @head

    if index == 0
      @head = @head.next
      node.next = nil
    else
      i = 0
      while i != index
        previous_node = node
        node = node.next
        i = i + 1
      end
      previous_node.next = node.next
      node.next = nil
    end
    true
  end

  def read
    elements = []
    return elements if @head.nil?
    node = head
    while node
      elements << node.value
      node = node.next
    end
    elements
  end

  def get(index)
    node = @head
    i = 0

    while i != index
      node = node.next
      i = i + 1
    end

    node.value
  end

  def reverse
    list = SinglyLinkedList.new
    node = @head

    while node
      list.add_at(0, node.value)
      node = node.next
    end
    list
  end

  def reverse!
    node = @head
    @head = @tail
    @tail = node

    [10, 20, 30, 40, 50]

    previous_node = nil
    next_node = nil
    for i in 1..length
      next_node = node.next
      node.next = previous_node
      previous_node = node
      node = next_node
    end
  end

  def length
    node = @head
    i = 0
    while node
      i = i + 1
      node = node.next
    end
    i
  end

  def pop
    delete(length-1)
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end
end

# list = SinglyLinkedList.new
# list.add(10)
# list.add(20)
# list.add(30)
# list.add(40)
# list.add(100)
# list.pop
# list.add_at(4, 50)
# list.delete(1)
# puts list.get(1)
# puts list.length
# puts list.read

# reverse_list = list.reverse
# puts reverse_list.read
#
# list.reverse!
# puts list.read
