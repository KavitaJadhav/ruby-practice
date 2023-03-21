# A module can be included in another module or class by using the include, prepend and extend keywords.

# include - Use module methods as instance methods. When multiple modules are included, methods of most recent module take precedence over others.
# prepend - Use module methods as instance methods. When module and including class have same method, module method takes precedence
# extend - When class extends module, methods in module becomes class methods in the including class

module Test
  def method1
    puts 'method1'
  end

  def method2
    puts 'module method2'
  end
end

class IncludeModule
  include Test

  def method2
    puts 'class method2'
  end
end

IncludeModule.new.method1
# method1
IncludeModule.new.method2
# class method2
IncludeModule.ancestors
# [IncludeModule, Test, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------
class IncludeModule
  prepend Test

  def method2
    puts 'class method2'
  end
end

IncludeModule.new.method1
# method1
IncludeModule.new.method2
# module method2
IncludeModule.ancestors
# [Test, IncludeModule, Test, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------
class IncludeModule
  extend Test

  def method2
    puts 'class method2'
  end
end

IncludeModule.method1
# method1
IncludeModule.method2
# module method2
IncludeModule.new.method2
# class method2
IncludeModule.ancestors
# [IncludeModule, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------

Test.class_eval do
  def method3
    puts 'module method3'
  end
end

class IncludeModule
  include Test
end

IncludeModule.new.method3 # class_eval is used to monkey patch new code in class / module
# module method3

# ------------------------------------------------------------------------------------------------------------------

#Scenario - calling module class method from class method of including class
module Test
  def Test.method4
    puts 'module class method4'
  end
end

class IncludeModule
  include Test
end


class IncludeModule2
  include Test

  def self.class_method
    puts 'calling module class method4 from another class method'

    Test.method4
  end
end


IncludeModule.method4 #undefined method `method4' for IncludeModule:Class (NoMethodError)
IncludeModule.new.method4 # undefined method `method4' for IncludeModule:instance_id
IncludeModule2.class_method
# calling module class method4 from another class method
# module class method4


# ------------------------------------------------------------------------------------------------------------------

