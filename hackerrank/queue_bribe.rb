#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'minimumBribes' function below.
#
# The function accepts INTEGER_ARRAY q as parameter.
#

def minimumBribes(queue)
  queue_in_order = queue.sort

  return 0 if queue_in_order==queue

  for i in 0..queue.size-1 do
    ordered_index = queue_in_order.index(queue[i])
    return 'Too chaotic' if (ordered_index-i).abs>2
  end

  bribes = 0

  for i in 1..queue.size-1 do
    if queue[i-1] > queue[i]

      temp = queue[i-1]
      queue[i-1] = queue[i]
      queue[i] = temp
      bribes = bribes + 1
    end
  end

  return bribes
end

t = gets.strip.to_i

t.times do |t_itr|
  n = gets.strip.to_i

  q = gets.rstrip.split.map(&:to_i)

  puts minimumBribes q
end
