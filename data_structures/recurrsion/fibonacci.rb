# Todo: rewrite with memorization/cache

def fibonacci(count)
  return 1 if count < 2
  fibonacci(count - 2) + fibonacci(count - 1)
end

def fibonacci_print(count)
  puts 1 && return if count < 2
  puts (fibonacci(count - 2) + fibonacci(count - 1))
end

fibonacci_print(10)
puts fibonacci(10)