# SimpleObject - method_missing
# Object < SimpleObject -
# Array,String < Object

# When method_missing overridden, overwrite respond_to_missing?

# method_missing is instance method, define_method is class method. define_method can not be called inside method_missing method.
class Hashie
  def initialize
    @pairs = {}
  end

  def method_missing(name, *args)
    name = name.to_s
    if name.end_with?('=')
      @pairs[name[0...-1]] = args
    else
      @pairs[name]
    end
  end

  def respond_to_missing?(name, *args)
    @pairs.keys.include?(name.to_s)
  end
end

hash = Hashie.new

hash.name = 'Kavita'
hash.company = 'TW'

puts hash.name
puts hash.company

puts hash.respond_to?(:company)


