# SimpleObject - method_missing
# Object < SimpleObject -
# Array,String < Object

class User
  def method_missing(name, *args)
    puts "Missing method defination #{name}"
  end
end

puts User.new.foo
puts User.new.bar
