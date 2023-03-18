class Array
  def self.add_method(name, &block)
    send(:define_method, name) do |text|
      block.call(self, text)
    end
  end
end

Array.add_method('prepend_') do |list, text|
  list.each { |e| puts "#{text} - #{e}" }
end

Array.add_method('append_') do |list, text|
  list.each { |e| puts "#{e} - #{text}" }
end

[1, 2, 3].prepend_("Hello")
[1, 2, 3].append_("Hello")