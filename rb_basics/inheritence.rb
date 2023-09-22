# Ruby supports only single class/table inheritance(STI), it does not support multiple class inheritance but it supports mixins(modules).

# Ruby access modifiers

# Public
# public methods can be called with instance of parent / child class

# Private
# Private methods can not be called with instance of parent / child class,
# Private methods are available in child class and can be called from child class public, private, protected method

# Protected
# Protected methods can not be called with instance of parent / child class directly
# Protected methods are available in child class and can be called from child class public, private, protected method
# Protected method can be called on instance of class / sub class from other method of same class / subclass

class SuperClass
  def call
    puts 'Parent method'
  end
end

class SubClass < SuperClass
  def call
    puts 'Child method'
  end
end

SubClass.new.call
# Child method

# ------------------------------------------------------------------------------------------------------------------

class SuperClass
  def public_method
    puts 'Parent public method'
  end

  protected

  def protected_method
    puts 'Parent protected method'
  end

  private

  def private_method
    puts 'Parent private method'
  end
end

SuperClass.new.public_method
# Parent public method
SuperClass.new.protected_methods
# protected method `protected_method' called for #<SuperClass:0x000000011034cbf8> (NoMethodError)
SuperClass.new.private_method
# private method `private_method' called for #<SuperClass:0x00000001105a7b00> (NoMethodError)

class SubClass < SuperClass

end

SubClass.new.public_method
# Parent public method
SubClass.new.protected_method
# protected method `protected_method' called for #<SubClass:0x00000001103a6298> (NoMethodError)
SubClass.new.private_method
# private method `private_method' called for #<SubClass:0x000000011066adf8>

class SubClass < SuperClass
  def call_parent_protected_method
    protected_method
  end

  def call_parent_private_method
    private_method
  end
end

SubClass.new.call_parent_protected_method
# Parent protected method
SubClass.new.call_parent_private_method
# Parent private method

class SubClass < SuperClass
  def call1
    call_parent_protected_method_from_private_method
  end

  def call2
    call_parent_protected_method_from_protected_method
  end

  private

  def call_parent_protected_method_from_private_method
    protected_method
  end

  protected

  def call_parent_protected_method_from_protected_method
    protected_method
  end
end

SubClass.new.call1
# Parent protected method
SubClass.new.call2
# Parent protected method

class SubClass < SuperClass
  def call1
    call_parent_private_method_from_private_method
  end

  def call2
    call_parent_private_method_from_protected_method
  end

  private

  def call_parent_private_method_from_private_method
    private_method
  end

  protected

  def call_parent_private_method_from_protected_method
    private_method
  end
end

SubClass.new.call1
# Parent private method
SubClass.new.call2
# Parent private method

# ------------------------------------------------------------------------------------------------------------------

class SuperClass
  def initialize(value)
    @value = value
  end

  def equals?(object)
    @value == object.value
  end

  protected

  def value
    @value
  end
end

obj1 = SuperClass.new(5)
obj2 = SuperClass.new(5)
obj3 = SuperClass.new(10)

obj1.equals?(obj2)
#  true
obj1.equals?(obj3)
#  false

class SubClass < SuperClass
  def equals?(object)
    @value == object.value
  end
end

obj1 = SubClass.new(5)
obj2 = SubClass.new(5)
obj3 = SubClass.new(10)

obj1.equals?(obj2)
#  true
obj1.equals?(obj3)
#  false
obj2.value
# protected method `value' called for #<SubClass:0x000000010c9d9268 @value=5> (NoMethodError)

