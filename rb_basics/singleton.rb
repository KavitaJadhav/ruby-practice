require 'singleton'
class TestSingleton
  include Singleton

end
puts TestSingleton.instance.object_id
