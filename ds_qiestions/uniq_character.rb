require 'byebug'

def uniq_character(input)
# when blank, nil input
# - return -1
# when 1st uniq character present
# - return index
# when no uniq character
#  - return -1
# Single character
#  - return 0
#
# case_sensitive?
# Very large string
# space, consider it as character?
# special characters? numbers?

  return -1 if input.nil? || input.empty?
  not_found_index = -1

  return 0 if input.length == 1

  cache = Hash.new(0) #O(K) space
  input.each_char.each {|character| cache[character] = cache[character].next} # O(N) time

  input.each_char.with_index {|character, index| return index if cache[character] == 1}
  not_found_index
end

puts "nil - #{uniq_character(nil) == -1}"
puts "'' - #{uniq_character('') == -1}"
puts "' ' - #{uniq_character(' ') == 0}"
puts "apple - #{uniq_character('apple') == 0}"
puts "a - #{uniq_character('a') == 0}"
puts "abcabc - #{uniq_character('abcabc') == -1}"
puts "aaaaa - #{uniq_character('aaaaa') == -1}"
large_string = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.
Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.
Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero.
Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis.
Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa.
Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh.
Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis.
Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien.
Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna.
Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam.'
puts "Lorem ipsam - #{uniq_character(large_string) == 0}"
