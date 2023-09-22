class Student
  def def1
    puts 'def1'
  end

  def def2
    puts 'def2'
  end
end

class Student
  def def3
    puts 'def3'
  end
end

s = Student.new
s.def1
s.def2
s.def3

Student.class_eval do
  def def4
    puts 'def4'
  end
end

s.def4 # this will work for existing objects too

s.instance_eval do
  def def5
    puts 'def5'
  end
end

s.def5 # this will work for only object on which method is defined
Student.new.def5 #  undefined method `def5' - Will not work for different object

def s.def6
  puts 'def6'
end

s.def6 # this will work for only object on which method is defined

def Student.def7
  puts 'def7'
end

s.def7 # undefined method `def7' for #<Student
Student.new.def7 # undefined method `def7' for #<Student
Student.def7 # This works as def7 is class method

class << s
  def def8
    puts 'def8'
  end
end

s.def8 # this will work for only object on which method is defined
Student.new.def8 # undefined method `def8' for #<Student

class Student
  def def9
    puts 'def9'
    @value = 'value'
  end
end

s.def9
s.instance_eval { puts @value } # method call will initialize value

Student.new.instance_eval { puts @value } # This works. but @value is not initialized

# ----------- old code ---------
class Student
  def initialize(*marks)
    @marks = marks
  end

  def last_name
    '1'
  end
end

class Student
  def first_name
    '2'
  end
end

s.instance_eval do
  def middle_name
    '3'
  end
end

Student.class_eval do
  def full_name
    '4'
  end
end

def s.hi
  'hi'
end

def Student.hello
  'hi'
end

s = Student.new 1, 2
puts s.full_name
# puts s.first_name
# puts s.last_name
# puts s.ab_kya
# puts s.middle_name

puts s.instance_eval { print @marks }

s.instance_eval do
  def marks
    @marks
  end
end

# puts s.marks

class << s
  def ab_kya
    '5'
  end
end

# puts s.ab_kya
s2 = Student.new 1, 2, 3
puts s2.full_name
