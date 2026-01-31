# You are given a list of n integers and a number k. Your task is to shuffle the array in such a way that, starting from the first element, every k-th element moves to the end of the array.
#
#     For instance, if nums = [1, 2, 3, 4, 5, 6, 7, 8] and k = 3, the output should be [1, 2, 4, 5, 7, 8, 3, 6]. Here, the 3rd element 3 and the 6th element 6 (every 3rd element starting from the first) are moved to the end of the array.
require 'byebug'
def shuffle_array(numbers, count)
#
# TODO: Rearrange the array so that every k-th element moves to the end while preserving the order of other elements.
  inplace_values = []
  moved_values = []
  numbers.each_with_index do |number, index|
    # byebug
    if (index + 1) % count == 0
      moved_values << number
    else
      inplace_values << number
    end
  end
  return inplace_values + moved_values

end

puts shuffle_array([1, 2, 3, 4, 5, 6, 7, 8], 3)==[1, 2, 4, 5, 7, 8, 3, 6]