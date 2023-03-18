class BubbleSort
  def sort(array)
    array_length = array.size
    for i in 0..array_length
      for j in 0..array_length - i
        if i > j
          tmp = array[i]
          array[i] = array[j]
          array[j] = tmp
        end
      end
    end

    array
  end
end

puts BubbleSort.new.sort([2, 1, 5, 4])