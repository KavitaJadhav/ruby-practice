# https://www.geeksforgeeks.org/dsa/merge-sort/
#
# Here's a step-by-step explanation of how merge sort works:
# Divide: Divide the list or array recursively into two halves until it can no more be divided.
# Conquer: Each subarray is sorted individually using the merge sort algorithm.
# Merge: The sorted subarrays are merged back together in sorted order. The process continues until all elements from both subarrays have been merged.
#
#Time Complexity: O(N log n)
# Best Case: O(n log n), When the array is already sorted or nearly sorted.
#     Average Case: O(n log n), When the array is randomly ordered.
#         Worst Case: O(n log n), When the array is sorted in reverse order.
#     Auxiliary Space: O(n), Additional space is required for the temporary array used during merging.
#


        class Array
  def present?
    size > 0
  end

end

def merge(left, right)

  result = []
  while left.present? || right.present?
    if left.empty?
      return result + right
    end

    if right.empty?
      return result + left
    end

    if left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end
  end
  result
end

def merge_sort(array)
  return array if array.length == 1

  mid = array.length / 2
  left = array[0..mid - 1]
  right = array[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end


# puts(merge([30, 40], [10,20]))
puts(merge_sort([40, 30, 20, 10]))

