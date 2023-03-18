def selection_sort(array)
  for i in 0..array.size - 1
    for j in i + 1..array.size - 1
      if array[j] < array[i]
        tmp = array[j]
        array[j] = array[i]
        array[i] = tmp
      end
    end
  end
  array
end

def selection_sort_optimised(array)
  for i in 0..array.size - 1
    min_index = i
    for j in i + 1..array.size - 1
      if array[j] < array[min_index]
        min_index = j
      end
    end

    if min_index != i
      tmp = array[i]
      array[i] = array[min_index]
      array[min_index] = tmp
    end
  end
  array
end

puts(selection_sort([5, 1, 3, 7, 4, 9, 4]))
puts(selection_sort_optimised([5, 1, 3, 7, 4, 9, 4]))