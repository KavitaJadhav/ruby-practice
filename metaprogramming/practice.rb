module Test
  def method1
    puts 'method1'
  end

  def method2
    puts 'module method2'
  end
end

class IncludeModule
  prepend Test

  def method2
    puts 'class method2'
  end
end


IncludeModule.new.method1
# method1
IncludeModule.new.method2