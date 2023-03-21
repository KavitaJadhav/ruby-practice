# File content
# data line 1
# data line 2

File.open('data.txt').read
# "data line 1\ndata line 2"

File.open('data.txt').readlines
# ["data line 1\n", "data line 2"]

File.read('data.txt')
# "data line 1\ndata line 2"

File.foreach("data.txt") { |line| puts line }
# data line 1
# data line 2

data = []
File.foreach("data.txt") { |line| data << line }
data
# => ["data line 1\n", "data line 2"]

File.open('data.txt', 'w') { |file| file.write "written" }
# => 7
# File Content - written
File.open('data.txt', 'a') { |file| file.write 'append' }
# => 6
# File Content - writtenappend

File.open('data.txt', 'w+') { |file| file.write 'there' }
# => 5
# File Content - there -> rewrites file

File.write('data.txt', 'short write')
# => 11
# File Content - short write

File.write('data1.txt', 'new file write')
# File Content - new file write -> Creates new file with given content


File.write('data.txt', 'short append', mode: 'a')
# => 12
# File Content - short writeshort append

File.write('a.txt', 'hello', mode: 'a')
# => 5
# Created a new file in same directory, File Content - hello

file = File.open('a.txt')
# => #<File:a.txt>

File.open('data.txt').read