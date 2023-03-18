class String
  def self.add_method(name)
    send(:define_method, name) do
      puts "You are inside #{name} method"
    end
  end
end

String.add_method('random')
"string".random