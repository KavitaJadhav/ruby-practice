# Lambdas are defined with -> {} and procs with Proc.new {}.
# Procs return from the current method/execution context(no further execution), while lambdas return from the lambda itself.
# Procs don’t care about the correct number of arguments, while lambdas will raise an exception.
# There is no dedicated Lambda class. A lambda is just a special Proc object

sum = ->(a, b) { puts "sum = #{a + b}" }
sum.call(1, 2)
sum.(1, 2)

sum.call(1) #  wrong number of arguments (given 1, expected 2) (ArgumentError)

proc = Proc.new { |a, b| puts "a=#{a}, b=#{b}" }
proc.call(1, 2)
proc.call(1) # Works
proc.call(1,2,3) # Works

# --------

def hello1
  puts 'before lambda call'
  lambda = -> { return "Hello from lambda" }
  puts lambda.call
  puts 'after lambda call'
end

hello1
# before lambda call
# Hello from lambda
# after lambda call

def hello2
  puts 'before proc call'

  proc = Proc.new { return "Hello from proc" }
  puts proc.call
  puts 'after proc call'
end

hello2
# before lambda call
# => "Hello from proc"

# -------


def call_proc(proc)
  count = 500
  proc.call
end

count   = 1
proc = Proc.new { puts count }
p call_proc(proc)
# 1
# Proc use latest variable value


# ------
# variables used in proc should be defined before creating proc. Values of these variables can be updated later. When proc is called. It will use latest value like above

proc = Proc.new { foo }
foo = 1
proc.call # block in <top (required)>': undefined local variable or method `foo' for main:Object (NameError)

foo = 1
Proc.new { foo }.call
# => 1


# ---------
# bindings

foo = 1
bar = 2
binding.local_variables # [:bar, :foo, :_]
binding.eval('foo') # 1

