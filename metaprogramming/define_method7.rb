class Array
  def self.add_method(name, &block)
    define_method(name) do
      yield(self)
    end
  end
end

Array.add_method('read') do |array|
  mapping = {1 => 'one', 2 => 'two', 3 => 'three'}
  array.each {|e| puts "#{e} is #{mapping[e]}"}
end

[1, 2, 3, 2, 1].read