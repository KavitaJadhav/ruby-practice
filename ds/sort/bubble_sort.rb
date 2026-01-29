# Notes
# Last element bubbles up to the end
# keep comparing and swapping numbers until index -1 in each iteration
# Space complexity = O(N)
# Time complexity = O(N^2)
#
#
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