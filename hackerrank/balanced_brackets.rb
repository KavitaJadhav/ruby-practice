#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isBalanced(str)
  return "NO" if(str.length.odd?)
  opening_closing_brackets = {"}" => "{","]" => "[",")" => "(" }
  stack = []

  str.split('').each do |sym|
    if(opening_closing_brackets.keys.include?(sym))
      if stack.last == opening_closing_brackets[sym]
        stack.pop
      else
        stack.push(sym)
      end
    else
      stack.push(sym)
    end
  end

  stack.empty? ? 'YES' : 'NO'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
  s = gets.chomp

  result = isBalanced s

  fptr.write result
  fptr.write "\n"
end

fptr.close()
