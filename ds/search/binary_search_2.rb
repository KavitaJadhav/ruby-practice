def binary_search(array, element)
  if array.size == 1
    return array.first == element
  end

  mid_index = array.size / 2

  if element < array[mid_index]
    return binary_search(array[0..mid_index - 1], element)
  else
    return binary_search(array[mid_index..-1], element)
  end
end

def binary_search_loop(array, element)
  while array.size > 0 do
    if array.size == 1
      return array.first == element
    end

    mid_index = array.size / 2

    if element < array[mid_index]
      array = array[0..mid_index - 1]
    else
      array = array[mid_index..-1]
    end
  end
end

# puts binary_search([8, 9], 8)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 8)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 5)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 2)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 10)

puts binary_search_loop([8, 9], 8)
puts binary_search_loop([1, 2, 3, 4, 5, 6, 7, 8, 9], 8)
puts binary_search_loop([1, 2, 3, 4, 5, 6, 7, 8, 9], 5)
puts binary_search_loop([1, 2, 3, 4, 5, 6, 7, 8, 9], 2)
puts binary_search_loop([1, 2, 3, 4, 5, 6, 7, 8, 9], 10)