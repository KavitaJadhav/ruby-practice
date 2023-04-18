#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'superDigit' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. STRING n
#  2. INTEGER k


def superDigit(n, k)

  return n.to_i if n.size==1 and k==1

  digits =  (n.split('').map(&:to_i).sum * k).to_s

  while(digits.length > 1) do
    digits = digits.split('').map(&:to_i)
    digits = digits.sum.to_s
  end

  return digits.to_i
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0]

k = first_multiple_input[1].to_i

result = superDigit n, k

fptr.write result
fptr.write "\n"

fptr.close()


#3546630947312051453014172159647935984478824945973141333062252613718025688716704470547449723886626736 100000

