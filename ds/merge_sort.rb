def merge(array1, array2)
  merged_arr = []
  i = 0;
  j = 0;
  while (i <= array1.size && j <= array2.size)

    if i == array1.size
      return merged_arr + array2[j..-1]
    end

    if j == array2.size
      return merged_arr + array1[i..-1]
    end

    if array1[i] < array2[j]
      merged_arr << array1[i]
      i = i + 1
    else
      merged_arr << array2[j]
      j = j + 1
    end
  end
  merged_arr
end


def merge_sort(array)
  return array if array.size <= 1

  mid = array.length / 2 - 1
  left = array[0..mid]
  right = array[mid + 1..-1]

  merge(merge_sort(left), merge_sort(right))
end


# puts(merge([30, 40], [10,20]))
puts(merge_sort([40, 30, 20, 10]))

