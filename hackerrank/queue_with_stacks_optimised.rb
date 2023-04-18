# Enter your code here. Read input from STDIN. Print output to STDOUT

@stack1 = []
@stack2 = []

def enqueue(num)
  @stack1.push(num)
end


def dequeue
  return if (@stack2.empty? && @stack1.empty?)

  if @stack2.empty?
    @stack1.size.times do
      @stack2.push(@stack1.pop())
    end
  end

  @stack2.pop
end

def read
  if(@stack2.empty?)
    puts @stack1.first
  else
    puts @stack2.last
  end
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