#!/bin/ruby

require 'json'
require 'stringio'
require 'byebug'

def truckTour(petrolpumps)

  petrolpumps_count = petrolpumps.size
  for i in 0..petrolpumps.size - 1 do
    total_distance = 0
    total_petrol = 0

    for j in i..i + (petrolpumps.size - 1) do
      total_petrol = total_petrol + petrolpumps[j % petrolpumps_count][0]
      total_distance = total_distance + petrolpumps[j % petrolpumps_count][1]

      break if total_distance > total_petrol

      return i if j == i + (petrolpumps.size - 1)
    end
  end
end

petrolpumps = [[1, 5],
               [10, 3],
               [3, 4]]
puts truckTour petrolpumps