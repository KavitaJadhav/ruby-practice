# Incomplete. Coming up with problem statement
class User
  def self.read_all
    CSV.open('./orm.csv', 'w') do |record|

    end
  end



end

users = User.read_all

puts users.map(&:inspect)