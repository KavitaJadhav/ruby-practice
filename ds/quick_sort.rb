def swap(array, index1, index2)
  tmp = array[index1]
  array[index1] = array[index2]
  array[index2] = tmp
end

def pivot(array, start_index, end_index)
  swap_index = start_index
  value = array[start_index]

  for i in start_index + 1..end_index
    if value > array[i]
      swap_index = swap_index + 1
      swap(array, i, swap_index)
    end
  end

  swap(array, start_index, swap_index)
  swap_index
end

def quick_sort(array, start_index, end_index)
  if start_index < end_index
    pivot_index = pivot(array, start_index, end_index)

    quick_sort(array, start_index, pivot_index - 1)
    quick_sort(array, pivot_index + 1, end_index)
  end
  array
end

array = [2, 5, 3, 7, 8, 4, 1]
# puts pivet(array, 0, array.length)
puts quick_sort(array, 0, array.length - 1)
# puts quick_sort(array, 0, array.size - 1)
#
#
# Notes
# fist need swap function
# pivot function which will give expected index on pivot element
# quick_sort function which will find pivot then repeat process for lets side and right side elements
# Exit condition -  when start and end of arry becomes same
#