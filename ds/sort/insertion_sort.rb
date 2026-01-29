def insertion_sort(array)
  for i in 1..array.size - 1
    for j in (i).downto(0)

      current = array[j]
      previous = array[j - 1]
      if current < previous
        array[j] = previous
        array[j - 1] = current
      else
        break
      end
    end
  end
  array
end


# puts(insertion_sort([3, 4, 1, 7, 2, 5, 9]))
# puts(insertion_sort([3, 4, 1]))
puts(insertion_sort([3, 4, 2]))
# puts(insertion_sort([3, 1, 4]))
# puts(insertion_sort([4, 1]))
