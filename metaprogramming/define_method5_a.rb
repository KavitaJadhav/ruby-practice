# Class attributes with attr_accessor
# It will display all fields in inspect object
#<Article:0x000000010632d870 @name="a", @author="b">

class Model
  # @@fields = []

  def self.field name
    attr_accessor(name)
    # @@fields << name
  end

  # def initialise
  #   @fields = @@fields
  # end
end

class Article < Model
  field :name
  field :author
end

article = Article.new
article.name = 'a'
article.author = 'b'

puts article.inspect
puts article.name
puts article.author