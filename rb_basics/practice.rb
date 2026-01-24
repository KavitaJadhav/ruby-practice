class Test
  def foo
    puts 'method started'
    threads = []
    for i in 1..10 do
      threads << Thread.new(i) {|i| sleep(1); puts "in thread #{i}"}
    end
    threads.map(&:join)
    puts 'method end'
  end
end

Test.new.foo