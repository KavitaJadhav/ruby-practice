# Given two numbers as strings. The numbers may be very large (may not fit in long long int), the task is to find sum of these two numbers.

num1 = '3567817737383839329754876'
num2 = '35781773738383932372965'

new_num1 = num1.reverse
new_num2 = num2.reverse

len = [num1.size, num2.size].max

res = ''
carry = 0
for i in 0..len do
  val = new_num1[i].to_i + new_num2[i].to_i + carry
  carry = val / 10
  digit = val % 10
  res = res + digit.to_s
end

puts res.reverse.to_i
puts num1.to_i + num2.to_i
