class Article
  attr_accessor :name, :author, :date

  def assign(values)
    values.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end

article = Article.new
article.assign({ name: 'a', author: 'b', date: 'c' })
puts article.inspect