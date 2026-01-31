def reverse_array(array)
  # TODO: Reverse the array in place without using any additional lists or built-in methods for reversing.
  #
  # array is empty
  # - return empty array
  # array 1 element
  # return array
  # array has more than 1 element
  # bad inputs - return error

  return 'Bad array' if  array.nil? || array == ''

  return array if array.size == 1

  last_index = array.length - 1

  for index in 0..last_index
    break if index >= last_index-index
    array[index] , array[last_index-index] = array[last_index-index],  array[index]
  end
  array
end
# [0, 1, 2, 3, 4, 5]
# [1, 3, 7, 5, 9, 11]
puts reverse_array([11, 9, 7, 5, 3, 1])==[5,4,3,2,1]
