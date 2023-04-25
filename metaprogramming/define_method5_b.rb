# Class attributes with attr_accessor
# It will display all fields in inspect object
#<Article:0x000000010632d870 @name="a", @author="b">
class Model
  def self.attribute(name)
    define_method("#{name}") do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |val|
      instance_variable_set("@#{name}", val)
    end
  end
end


class Article < Model
  attribute :name
  attribute :author
end

article = Article.new
article.name = 'a'
article.author = 'b'

puts article.inspect
puts article.name
puts article.author