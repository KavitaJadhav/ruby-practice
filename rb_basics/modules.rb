
module Test
  def Test.m1
    puts 'm1'
  end

  def m2
    puts 'm2'
  end
end


Test.class_eval do
  def m3
    puts 'm3'
  end
end

class Foo
  include Test

  def self.k1
    Test.m1
  end

  def self.k2
    self.m1
  end

  def k3
    Test.m2
  end

  def k5
    Test.m1
  end

  def k4
    m2
  end
end


module Oyy
  def k1
    puts 'k1'
  end

  def Oyy.k2
    puts 'k2'
  end
end

class Bar
  extend Oyy
end

Bar.k1
Bar.k2
Bar.new.k1

class Foo
  def info
    'ssuperclas'
  end
end

class Barrr < Foo
  def info
    'subclass'
  end
end


nil.nil?
''.nil?
nil.blank?
false.blank?
"".empty?
" ".empty?
{}.empty?
nil.empty?
"".present?
" ".present?
0.present?
"\t\n".empty?
"\t\n".present?


nil.nil? - true
''.nil? - false
nil.blank? - true
false.blank? - true
"".empty? true
" ".empty? falsse
{}.empty? true
nil.empty? error
"".present? false
" ".present? false
0.present? true
"\t\n".empty? false
"\t\n".present? false

['10', '200', '1001', '105']

class User
  def test1
    puts 'test1'
  end

  protected

  def test2
    puts 'test2'
  end

  private

  def test3
    puts 'test3'
  end
end

class Studentt < User
  def test4
    test2
  end

  def test5
    test3
  end
end

User.new.test1
User.new.test2
User.new.test3
Studentt.new.test2
Studentt.new.test4
Studentt.new.test5


class Userr
  def age

  end

  def teen?
    age.between?(13, 19)
  end
end

Userr.class_eval do
  def bdate
    '22'
  end
end

['100', '129', '200', '130', '120'].sort


class Foo
  def bar(a, b)
    a+b
  end
end
