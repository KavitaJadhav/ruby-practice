require 'byebug'

def large_substring(input)

# nil or empty string
# return 0
  return 0 if input.nil? || input.empty?
  return 1 if input.size == 1

  maxsize = 0
  left_pointer = 0
  # right_pointer = 0
  character_index_map = {}

  input.each_char.with_index do |character, right_pointer|
    character_previous_index = character_index_map[character]
    byebug
    if character_previous_index

      if character_previous_index >= left_pointer
        left_pointer = character_previous_index + 1
        character_index_map[character]=right_pointer
        maxsize = right_pointer - left_pointer if right_pointer - left_pointer > maxsize
      end
    else
      character_index_map[character] = right_pointer
      maxsize = right_pointer - left_pointer if right_pointer - left_pointer > maxsize
    end

  end
  return maxsize
end

# puts large_substring('') == 0
# puts large_substring(nil) == 0
# puts large_substring('aabcd') == 4
# puts large_substring('abcabc') == 3
# puts large_substring('abbcabc') == 3
# puts large_substring('abcabcbb') == 3
# puts large_substring('abcdabcdefabcde') == 6
# puts large_substring('abcabc') == 3
# puts large_substring('abcabd') == 4
puts large_substring('aabbxyz') == 4
