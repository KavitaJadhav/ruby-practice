class ThreadDemo1
  def call
    list = [1, 2, 3, 4]

    list.each do |num|
      Thread.new(num) {|element|
        puts "Started #{element}"
      }
    end
  end
end

# thread = ThreadDemo1.new
# thread.call

class ThreadDemo2
  def call
    list = [1, 2, 3, 4]
    threads = []
    list.each do |num|
      threads << Thread.new(num) {|element|
        puts "Started #{element}"
      }
    end

    threads.each(&:join)
  end
end


# thread = ThreadDemo2.new
# thread.call


class ThreadDemo3
  def call
    test = 5

    thread = Thread.new do
      puts test

      sleep 1
      puts test
    end
    test = 10


    thread.join
  end
end
#
#
# thread = ThreadDemo3.new
# thread.call

class ThreadDemo4
  def call
    i = 0
    threads = []
    5.times do
      i = i + 1

      threads << Thread.new do
        # sleep 1
        puts i
      end
    end

    threads.each(&:join)
  end
end

# thread = ThreadDemo4.new
# thread.call

class ThreadDemo4
  def call
    require 'thread'

    value = 'original'

    t = Thread.new(value) do |t_value|
      sleep 1
      puts "#{t_value}- in thread"
    end

    value = 'changed'
    puts "#{value}- outside thread"

    t.join
  end
end


thread = ThreadDemo4.new
thread.call


