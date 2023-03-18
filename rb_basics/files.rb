puts File.open('data.txt').read
puts File.open('data.txt').readlines
puts File.read('data.txt').readlines
File.foreach("data.txt") { |line| puts line }

File.open('data.txt', 'w') { |file| file.write "written"}
File.open('data.txt', 'a'){|file| file.write 'append'}

File.write('data.txt', 'short write')
File.write('data.txt', 'short append', mode: 'a')



File.write('a.txt', 'hello', mode: 'a')

file = File.open('a.txt')