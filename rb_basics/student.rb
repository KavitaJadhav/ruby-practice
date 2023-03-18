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

s = Student.new 1,2
puts s.full_name
# puts s.first_name
# puts s.last_name
# puts s.ab_kya
# puts s.middle_name

puts s.instance_eval{print @marks}

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
s2 = Student.new 1,2,3
puts s2.full_name

