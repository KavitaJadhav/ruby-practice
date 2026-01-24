# A module can be included in another module or class by using the include, prepend and extend keywords.

# include - Use module methods as instance methods. When module and including class have same method, class instance method takes precedence. When multiple modules are included, methods of most recent module take precedence over others.
# prepend - Use module methods as instance methods. When module and including class have same method, module method takes precedence
# extend - When class extends module, methods in module becomes class instance methods in the including class

module TestModule
  def TestModule.method1
    puts 'module class instance method4'
  end
end

class TestClass
  extend TestModule

  def self.class_method
    TestModule.method1
  end
end


TestClass.class_method
# method1
TestClass.method1
# undefined method `method1' for TestClass:Class (NoMethodError)

