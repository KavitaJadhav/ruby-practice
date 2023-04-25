for i in 1..10 do
  puts i
end

5.times do
  puts 'hello'
end

5.times do |i|
  puts i
end

a = [10, 20, 30, 40]
for i in a do
  puts i
end

i = 3
while i < 10 do
  puts i
  i = i + 1
end

i = 15
until i < 10 do
  puts i
  i = i - 1
end

i = 1
loop do
  puts i
  i = i + 1
  break if i == 10
end

for i in 1..10 do
  next if i % 5 == 0
  puts i
end

[1, 2, 3].each do |num|
  puts num
end
[1, 2, 3].each { |num| puts num }
[1, 2, 3].map { |num| num * num }

[10, 20, 30].each_with_index do |value, index|
  puts "index #{index}, value #{value}"
end
