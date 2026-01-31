require 'byebug'
def frequest_element(input)
#   empty  = -1
#  all elements are uniq
# - -1
#  more then one frequent elements
# -
  frequency_map = Hash.new(0)

  input.each do |element|
    frequency_map[element] += 1
  end
  frequency_map.max_by{|key, value| value}.first
end

puts frequest_element([1, 1, 2, 3, 3, 3, 4]) == 3
