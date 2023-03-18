class SuperEnum
  def self.enum(**enums)
    enums.each do |attr, values|
      define_method("#{attr}=") do |val|
        instance_variable_set("@#{attr}", val)
      end

      define_method("#{attr}") do
        instance_variable_get("@#{attr}")
      end

      values.each do |value|
        define_method("#{value}?") do
          instance_variable_get("@#{attr}") == value
        end
      end
    end
  end
end


class User < SuperEnum
  enum status: [:pending, :active, :confirm]
end

# user = User.new
# user.status = :active
# puts user.active?
# puts user.pending?
# puts user.confirm?
# puts user.status


class String
  def self.add_method(name)
    # define_method('foo') do
    #   puts "Method #{name} is defined"
    # end
    send(:define_method, name) {puts "Method #{name} is defined"}

  end
end

# String.add_method('foo')
# "some string".foo

#
# class User
#   attr_accessor :status
# #   Active and Pending, Cancelled
#
#   ['Active', 'Pending'].each do |value|
#     define_method("#{value.downcase}!") do
#       self.status = value
#     end
#   end
# end
#
# user = User.new
# user.status = 'Pending'
# puts user.status
# puts user.active!
# puts user.status


