# Define method, define attribute getter,setter dynamically
# #<Article:0x0000000110fac8d0>
#
class Model
  @@fields = {}

  def self.field name

    send(:define_method, name) do
      @@fields[name]
    end

    send(:define_method, "#{name}=") do |value|
      @@fields[name] = value
    end
  end

  def initialise
    @fields = @@fields
  end
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