# A module can be included in another module or class by using the include, prepend and extend keywords.

# include - Use module methods as instance methods. When module and including class have same method, class method takes precedence. When multiple modules are included, methods of most recent module take precedence over others.
# prepend - Use module methods as instance methods. When module and including class have same method, module method takes precedence
# extend - When class extends module, methods in module becomes class methods in the including class

module TestModule
  def method1
    puts 'method1'
  end

  def method2
    puts 'module method2'
  end
end

class TestClass
  include TestModule

  def method2
    puts 'class method2'
  end
end

TestClass.new.method1
# method1
TestClass.new.method2
# class method2
TestClass.ancestors
# [TestClass, TestModule, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------
class TestClass
  prepend TestModule

  def method2
    puts 'class method2'
  end
end

TestClass.new.method1
# method1
TestClass.new.method2
# module method2
TestClass.ancestors
# [TestModule, TestClass, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------
class TestClass
  extend TestModule

  def method2
    puts 'class method2'
  end
end

TestClass.method1
# method1
TestClass.method2
# module method2
TestClass.new.method2
# class method2
TestClass.ancestors
# [TestClass, Object, PP::ObjectMixin, Kernel, BasicObject]

# ------------------------------------------------------------------------------------------------------------------

TestModule.class_eval do
  def method3
    puts 'module method3'
  end
end

class TestClass
  include TestModule
end

TestClass.new.method3 # class_eval is used to monkey patch new code in class / module
# module method3

# ------------------------------------------------------------------------------------------------------------------

#Scenario - calling module class method from class method of including class
# module class method can not be called as class method directly(outside class)
module TestModule
  def TestModule.method4
    puts 'module class method4'
  end
end

class TestClass
  include TestModule
end


class TestClass2
  include TestModule

  def self.class_method
    puts 'calling module class method4 from another class method'

    TestModule.method4
  end
end


TestClass.method4 #undefined method `method4' for TestClass:Class (NoMethodError)
TestClass.new.method4 # undefined method `method4' for TestClass:instance_id
TestClass2.class_method
# calling module class method4 from another class method
# module class method4


# ------------------------------------------------------------------------------------------------------------------
