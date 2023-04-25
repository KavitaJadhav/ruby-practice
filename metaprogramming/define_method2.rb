class String
  def self.add_method(name, &block)
    send(:define_method, name) do |*args|
      block.call(*args)
    end
  end
end

String.add_method("sum") do |a, b|
  puts "In Sum method"
  puts a + b
end
String.add_method("sub") do |a, b|
  puts "In Sub method"
  puts a - b
end

"string".sum(1, 2)
"string".sub(1, 4)