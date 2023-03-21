# Enum is feature of rails. its not available in Ruby
# https://medium.com/ruby-daily/how-and-why-to-use-enums-in-ruby-on-rails-2093fb7186e
# enum status: [:available, :discontinued, :pending]
# enum status: {
#   available: 0,
#   discontinued: 10,
#   pending: 20
# }


class Enum
  def self.enum(**args)
    args.each do |name, values|
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end

      define_method(name) do
        instance_variable_get("@#{name}")
      end

      values.each do |value|
        define_method("#{value}?") do
          instance_variable_get("@#{name}") == value
        end
      end
    end
  end
end

class User < Enum
  enum status: [:active, :pending]
end

user = User.new
user.status = :active
puts user.status
puts user.active?
puts user.pending?