class TestThread
  def call
    Thread.new { puts 'in thread' }
    puts 'hello'
  end
end

k = TestThread.new
k.call # Main Thread doesn't wait for completion of new thread
# hello
# => nil
# in thread

# ---------
class ThreadDemo1
  def call
    list = [1, 2, 3, 4]

    list.each do |num|
      Thread.new(num) { |element|
        puts "Started #{element}"
      }
    end
    puts 'at the end of the method'

  end
end

thread = ThreadDemo1.new
thread.call # Thread will execute in parallel. (no sequence)
# => [1, 2, 3, 4]
# Started 2
# Started 3
# Started 4
# Started 1

# ---------
#note - sometimes rails console gets stuck

class ThreadDemo2
  def call
    list = [1, 2, 3, 4]
    threads = []
    list.each do |num|
      threads << Thread.new(num) { |element|
        puts "Started #{element}"
      }
    end

    threads.each(&:join)
    puts 'at the end of the method'
  end
end

ThreadDemo2.new.call # wait for other threads to complete before closing main thread
# Started 2
# Started 1
# Started 4
# Started 3
# =>
#   [#<Thread:0x0000000107fe3a00 (irb):275 dead>,
#     #<Thread:0x0000000107fe3460 (irb):275 dead>,
#     #<Thread:0x0000000107fe2ec0 (irb):275 dead>,
#     #<Thread:0x0000000107fe2d80 (irb):275 dead>]

class TestThread
  def call1
    threads = []
    [1, 2, 3, 4].each do |num|
      Thread.start(num) { |num| puts "Started #{num}" }
    end
    puts 'After loop'
    threads.each(&:jon)
    puts 'After join'
  end

  def call2
    puts 'method call2'
  end

  def call3
    call1
    call2
    puts 'method call3'
  end
end

TestThread.new.call3 # Method doesn't wait for completion of thread. Calls next method. Wait for other threads to complete before closing main thread
# After loop
# After join
# method call2
# method call3
# => nil
# Started 4
# Started 3
# Started 1
# Started 2

# -------------
class TestThread
  def call
    num = 10
    puts "before thread - Num - #{num}"

    thread = Thread.start do
      puts "Thread - Num #{num}"
      sleep 1
      puts "Thread - Num #{num}"
    end
    num = 5
    puts "after thread - Num - #{num}"
    thread.join
  end
end

TestThread.new.call # Thread will use updated value for variable from the moment value is changed
# before thread - Num - 10
# after thread - Num - 5
# Thread - Num 5
# Thread - Num 5

class ThreadDemo4
  def call
    i = 0
    threads = []
    500.times do

      threads << Thread.new do
        # sleep 1
        puts i
      end
      i = i + 1
    end

    threads.each(&:join)
  end
end

ThreadDemo4.new.call # Its always printing last value in the loop. Figure out reason
ThreadDemo4.new.call # for 5000 different vak

# 500
# 500
# 500
# 500
# 500
# 500
class ThreadDemo4
  def call_with_param

    value = 'original'

    t = Thread.new(value) do |t_value|
      puts "#{t_value}- in thread"
    end

    value = 'changed'
    puts "#{value}- outside thread"

    t.join
    puts "#{value}- after thread complete"
  end

  def call_without_param

    value = 'original'

    t = Thread.new do
      puts "#{value}- in thread"
    end

    value = 'changed'
    puts "#{value}- outside thread"

    t.join
    puts "#{value}- after thread complete"
  end
end

ThreadDemo4.new.call_with_param # original value can be used in thread by passing it as parameter
# changed- outside thread
# original- in thread -> thread will have its own variable for params passed by value
# changed- after thread complete
ThreadDemo4.new.call_without_param
# changed- outside thread
# changed- in thread -> thread is reffering to same variable from main thread(memory)
# changed- after thread complete
