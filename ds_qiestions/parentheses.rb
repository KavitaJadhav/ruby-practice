require 'byebug'

def validate_parentheses(input)
# valid , input
# -
# '' - blank input, valid
# nil - return error
# invalid parenthesis
#

# Time: O(n) — iterate string once
#
# Space: O(n) — worst-case all openings on stack
#
  return false if input.nil?
  return true if input.empty?
  return false if input.size.odd?


  # parenthesis_map = {'{' => '}', '(' => ')', '[' => ']'}
  parenthesis_map = {'}' => '{', ')' => '(', ']' => '{'}


  parenthesis_stack = []


  input.each_char do |character|
    if parenthesis_map.values.include?(character)
      parenthesis_stack.push(character)
    end

    if parenthesis_map.keys.include?(character)
      return false if parenthesis_stack.pop != parenthesis_map[character]
    end
  end

  parenthesis_stack.empty?
end

puts validate_parentheses('')
puts validate_parentheses("()")
puts validate_parentheses("{[()]}")
puts !validate_parentheses("{[[)]}")
puts !validate_parentheses(nil)
puts !validate_parentheses('{{{')
puts !validate_parentheses('}}')
