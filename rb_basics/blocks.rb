def run_block
  puts 'before'
  yield
  puts 'after'
end

run_block {puts 'running block with curly braces'}

run_block do
  puts 'running block with do..end'
end

def run_param_block(a, b)
  puts 'before'
  yield(a, b)
  puts 'after'
end

run_param_block(10, 20) {|a, b| puts a + b}

run_param_block(10, 20) do |a, b|
  puts a + b
end


def test
  puts 'before'

  yield
  puts 'after'

end

test do
  puts 'in block'
end

test {puts 'in block'}

def foo(a, b)
  yield(a,b)
end

foo(1,2) do |a,b|
  puts a+b
end

foo(10,20){|a,b| puts a+b}

def accept_block a
  puts 'before yield'
  yield a
  puts 'after yield'
end

accept_block(1) do |a|
  puts "param a- #{a}"
end

accept_block(1) {|a| puts "param a- #{a}"}