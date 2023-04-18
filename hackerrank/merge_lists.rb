#!/bin/ruby
require 'json'
require 'stringio'
#
# Complete the 'truckTour' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY petrolpumps as parameter.
#
def merge(list1, list2)
  res = []
  i=0
  j=0
  while(i<list1.size && j<list2.size) do

    if(list1[i] < list2[j])
      res << list1[i]
      i = i+1
    else
      res << list2[j]
      j= j+1
    end
  end
  res = res + list1[i..-1]
  res = res + list2[j..-1]
  return res.join(' ')
end
fptr = File.open(ENV['OUTPUT_PATH'], 'w')
t = gets.strip.to_i

t.times do
  list1 = []
  list2 = []

  size1 = gets.strip.to_i

  size1.times do
    list1 <<    gets.to_i
  end

  size2 = gets.strip.to_i
  size2.times do
    list2 <<    gets.to_i
  end
  result = merge list1, list2
  fptr.write result + "\n"
end
fptr.write "\n"
fptr.close()