class TestSingleton
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end
end

TestSingleton.instance