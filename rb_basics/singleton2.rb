class SingletonClass
  @instance = new

  # private_class_method :new
  # private_class_method :new

  def self.instance
    @instance
  end
end

puts instance = SingletonClass.instance

puts SingletonClass.instance.object_id
puts SingletonClass.instance.object_id
