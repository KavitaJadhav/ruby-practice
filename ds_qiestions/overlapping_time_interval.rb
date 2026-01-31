require 'byebug'

def overlapping_time_interval(time_intervals)
#   when empty intervals list
# - return empty list back
# When overlapping intervals
# - intervals list
# when non-overlapping intervals
# - original list
# When interval overlapps to next day?
# - should include in the list
# when intervals have no window inbetween

# Assumptions
#   whole number
# positive numbers
# 24 htime_intervalsr clock
# intervals sorted? - no

#   Scale?
# Start with simple loop -> O(N)
  # Space = O(N)
  return [] if time_intervals.nil? || time_intervals.empty?
  time_intervals = time_intervals.sort_by {|start_time, end_time| start_time}

  merged_intervals = [time_intervals.first]
  time_intervals[1..-1].each do |start_time, end_time|
    last_interval = merged_intervals.last

    if last_interval[1] >= start_time
      last_interval[1] = [end_time, last_interval[1]].max
    else
      merged_intervals.push([start_time, end_time])
    end
  end
  merged_intervals
end

puts overlapping_time_interval([]) == []
puts overlapping_time_interval([[1, 3], [2, 6], [8, 10], [9, 12]]) == [[1, 6], [8, 12]]
puts overlapping_time_interval([[1, 3], [4, 6], [8, 10]]) == [[1, 3], [4, 6], [8, 10]]
puts overlapping_time_interval([[1, 5], [2, 3]]) == [[1, 5]]
puts overlapping_time_interval([[2, 3], [1, 5]]) == [[1, 5]]
puts overlapping_time_interval([[1,3], [3, 5]]) == [[1, 5]]
puts overlapping_time_interval([[21, 22], [1, 5]]) == [[1, 5]]