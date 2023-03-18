def binary_search(array, search_element)
  if array.size == 1
    return array[0] == search_element
  end

  mid = array.size / 2
  left = array[0..mid - 1]
  right = array[mid..array.size - 1]

  if search_element >= array[mid]
    binary_search(right, search_element)
  else
    binary_search(left, search_element)
  end
end

def binary_search_loop(array, search_element)

  if array.size == 1
    return array[0] == search_element
  end


  mid = array.size / 2
  start_index = 0;
  end_index = array.size - 1;

  while array[mid] != search_element && start_index != end_index do
    if (array[mid] > search_element)
      end_index = mid
      mid = mid / 2
    else
      start_index = mid + 1
      mid = (start_index + end_index) / 2
    end
  end

  array[mid] == search_element
end


puts binary_search([1, 2, 3, 4, 5, 9, 18], 9)
puts binary_search_loop([1, 2, 3, 4, 5, 9, 18], 4)
