class UserUser
  attr_accessor :status
  #   Active and Pending, Cancelled

  ['Active', 'Pending'].each do |value|
    define_method("#{value.downcase}!") do
      self.status = value
    end
  end
end

user = User.new
user.status = 'Pending'
puts user.status
user.active!
puts user.status