require 'byebug'
class MaxHeap
  def initialize
    @values = []
  end

  def add(value)
    if empty?
      @values.push(value) && return
    end

    @values.push(value)
    bubble_up(@values.size - 1)
  end

  def print
    puts @values
  end

  private

  def bubble_up(index)
    return if index <= 0
    node = @values[index]
    parent_index = (index -1) / 2
    parent = @values[parent_index]

    if parent < node
      @values[index] = parent
      @values[parent_index] = node
      bubble_up(parent_index)
    end
  end

  def empty?
    @values.empty?
  end
end

# Index:  0   1   2   3   4   5
# Value: [10, 20, 15, 30, 40, 50]

heap = MaxHeap.new
heap.add(10)
heap.add(15)
heap.add(50)
heap.add(20)
heap.add(40)
heap.add(30)

heap.print
