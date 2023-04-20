#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'pairs' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY arr
#

def pairs(k, arr)
  result = 0
  for i in 0..arr.size - 1 do
    for j in i..arr.size - 1 do
      result = result + 1 if (arr[i] - arr[j]).abs == k
    end
  end
  return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

result = pairs k, arr

fptr.write result
fptr.write "\n"

fptr.close()
