# Enter your code here. Read input from STDIN. Print output to STDOUT

@stack1 = []
@stack2 = []

def enqueue(num)
  @stack1.size.times do
    @stack2.push(@stack1.pop())
  end

  @stack1.push(num)

  @stack2.size.times do
    @stack1.push(@stack2.pop())
  end
end


def dequeue
  @stack1.pop
end

def read
  puts @stack1.last
end

def perform(options)
  if options[0] == '1'
    enqueue(options[1])
  elsif options[0] == '2'
    dequeue
  else
    read
  end

end

query_count = gets.to_i

query_count.times do
  input = gets
  options = input.split(" ")
  perform(options)
end