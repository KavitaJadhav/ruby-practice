require 'byebug'

class CustomArray
  def initialize
    @values = {}
    @last_index = -1
  end

  def push(element)
    increment_last_index
    @values[@last_index] = element
  end

  def pop
    @values.delete(@last_index)
    decrement_last_index
  end

  def print
    for iteration_index in 0..@last_index
      puts @values[iteration_index]
    end
  end

  def delete(index)
    deleted_value = @values[index]
    shift_from(index)
    puts "deleted #{deleted_value}"
  end

  def shift
    start_index = 0
    deleted_value = @values[start_index]
    shift_from(start_index)
    puts "shifted #{deleted_value}"
  end

  def unshift(value)
    start_index = 0

    for iteration_index in @last_index.downto(start_index)
      @values[iteration_index.next] = @values[iteration_index]
    end

    @values[start_index] = value
    increment_last_index
  end

  def reverse
    start_index = 0
    end_index = @last_index

    while (start_index < end_index) do
      @values[start_index], @values[end_index] = @values[end_index], @values[start_index]

      start_index = start_index.next
      end_index = start_index.pred
    end
  end

  private

  def shift_from(start_index)
    for iteration_index in start_index..@last_index
      @values[iteration_index] = @values[iteration_index.next]
    end

    @values.delete(@last_index)
    decrement_last_index
  end

  def increment_last_index
    @last_index = @last_index.next
  end

  def decrement_last_index
    @last_index = @last_index.pred
  end
end

numbers = CustomArray.new()

numbers.push(1)
numbers.push(2)
numbers.push(3)
numbers.push(4)
numbers.push(5)
# numbers.print
# 1,2,3,4,5

numbers.pop
numbers.pop
# numbers.print
# #1,2,3

numbers.delete(1)
# numbers.print
#1,3

numbers.shift
# numbers.print
# 3

numbers.unshift(1)
numbers.unshift(2)
# numbers.print
# 2,1,3

numbers.reverse
numbers.print
# 3,1,2

