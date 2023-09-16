# .ru extension - rack up

class App
  def call(env)
    [200, { 'Content-Type' => 'text/html' }, ["<H1> Hello from app</H1>", "Application configurations: </br> #{env}"]]
  end
end

run App.new()

# commands
# puma
# rackup