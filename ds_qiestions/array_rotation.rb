# You are provided with an array of n integers and a number k. Your task is to perform an anti-clockwise rotation (toward the front) of the array by k positions. The rotation should be done in place, which means you have to directly manipulate the input array without creating a new one. Note that k might be bigger than the array length.

# For example, if the input array is [1, 2, 3, 4, 5, 6, 7], and k = 3, then after the operation, the input array should look like [4, 5, 6, 7, 1, 2, 3].
require 'byebug'
# def anti_rotate_array(numbers, count)
#   # TODO: Perform an in-place anti-clockwise rotation of the array nums by k steps without using additional arrays.\
#   return numbers if numbers.uniq.size == 1
#   count = count % numbers.size
#   count.times do |index|
#     numbers[index], numbers[count] = numbers[count], numbers[index]
#
#     for start_swap_index in count..numbers.size - 2
#       numbers[start_swap_index], numbers[start_swap_index + 1] = numbers[start_swap_index + 1], numbers[start_swap_index]
#     end
#   end
#
#   numbers
# end

def array_reverse(numbers, start_index, end_index)

  # for index in start_index..end_index
  #   # break if index >= end_index - index
  #   array[index], array[end_index - index] = array[end_index - index], array[index]
  # end

  while (start_index < end_index) do

    tmp = numbers[start_index]
    numbers[start_index] = numbers[end_index]
    numbers[end_index] = tmp
    start_index = start_index.next
    end_index = end_index.pred
  end
  numbers

end

def anti_rotate_array(numbers, count)
  # TODO: Perform an in-place anti-clockwise rotation of the array nums by k steps without using additional arrays.\
  return numbers if numbers.uniq.size == 1
  count = count % numbers.size
# byebug
  array_reverse(numbers, 0, count - 1)
  array_reverse(numbers, count, numbers.length - 1)
  array_reverse(numbers, 0, numbers.length - 1)
end

puts anti_rotate_array([1, 2, 3, 4, 5, 6, 7], 3)
puts anti_rotate_array([1, 2, 3, 4, 5, 6, 7], 3) == [4, 5, 6, 7, 1, 2, 3]
puts anti_rotate_array([1, 2, 3, 4, 5, 6, 7], 10) == [4, 5, 6, 7, 1, 2, 3]
puts anti_rotate_array([1, 2, 3, 4, 5, 6, 7], 7) == [1, 2, 3, 4, 5, 6, 7]

