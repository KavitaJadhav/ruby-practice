# '22/08/1994'
require 'date'
class User
	def initialize(first_name, last_name, birth_date)
		@first_name = first_name
		@last_name = last_name
		@birth_date =   Date.parse(birth_date)
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end

	private
	def birth_date
		@birth_date
	end

	protected

	def first_name
		@first_name
	end
	def last_name
		@last_name
	end
end

class Student < User
	def name
		full_name
	end
		def age
		Time.now.year - birth_date.year
	end

	def equals?(object)
		first_name == object.first_name && last_name == object.last_name&& birth_date == object.birth_date
	end
end

user = Student.new('Kavita', 'Jadhav', '01/01/2001')
puts user.name
puts user.age

user2 = Student.new('Kavita', 'Jadhav', '01/01/2001')
puts user.equals?(user2)


