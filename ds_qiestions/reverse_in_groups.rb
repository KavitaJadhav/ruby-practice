def reverse(numbers, start_index, end_index)
  while (start_index < end_index) do

    tmp = numbers[start_index]
    numbers[start_index] = numbers[end_index]
    numbers[end_index] = tmp
    start_index = start_index.next
    end_index = end_index.pred
  end

  numbers
end

def reverse_in_groups(numbers, k)
  # TODO: Reverse the array in groups of k size, reversing smaller groups at the end if necessary.
  start_index = 0
  end_index = k-1

  while end_index < numbers.size do
    reverse(numbers, start_index, end_index)
    start_index = start_index + k
    end_index = end_index + k
  end
  reverse(numbers, start_index, numbers.size-1)
  numbers
end

puts reverse_in_groups([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 3)

