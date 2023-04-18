#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'gridChallenge' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING_ARRAY grid as parameter.

def gridChallenge(grid)
  puts grid
  puts "----------"
  grid = grid.map{|row| row.split('').sort!}

  for j in 0..grid[0].size-1 do
    for i in 0..grid.size-2 do
      return "NO" if grid[i][j] > grid[i+1][j]
    end
  end
  return "YES"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
  n = gets.strip.to_i

  grid = Array.new(n)

  n.times do |i|
    grid_item = gets.chomp

    grid[i] = grid_item
  end

  result = gridChallenge grid

  fptr.write result
  fptr.write "\n"
end

fptr.close()


# abcde
# fghij
# klmno
# pqrst
# uvwxy