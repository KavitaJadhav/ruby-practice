require 'byebug'
class ArrayHeapMax
  attr_reader :values

  def initialize
    @values = []
  end

  def add data
    @values << data
    return if @values.size==1

    index = @values.size - 1
    parent_index = (index - 1) / 2

    while parent_index >= 0 && @values[parent_index] < @values[index]
      swap(index, parent_index)

      index = parent_index
      parent_index = (index - 1) / 2
    end
  end

  def extract_max
    max = @values.shift
    last_node = @values.pop

    @values.unshift last_node

    parent_index = 0
    left_child = parent_index * 2 + 1
    right_child = parent_index * 2 + 1

    while @values[parent_index] < @values[left_child] || @values[parent_index] < @values[right_child]
      if @values[left_child] > @values[right_child]
        swap(left_child, parent_index)
        parent_index = left_child
        left_child = parent_index * 2 + 1
        right_child = parent_index * 2 + 1
      else
        swap(right_child, parent_index)
        parent_index = right_child
        left_child = parent_index * 2 + 1
        right_child = parent_index * 2 + 1
      end
    end

    max
  end

  private

  def swap(index1, index2)
    tmp = @values[index2]
    @values[index2] = @values[index1]
    @values[index1] = tmp
  end
end

heap = ArrayHeapMax.new
heap.add 10
heap.add 20
heap.add 30
heap.add 40
heap.add 50
puts heap.values
puts '----------------------'
puts heap.extract_max
puts heap.values
#
#
#             50
#      40               20
#
# 10       30
#
#
# 50 40 20 10 30 - after output


#
#
#             40
#      30               20
#
# 10
#
#
# 40 30 20 10 - after remove