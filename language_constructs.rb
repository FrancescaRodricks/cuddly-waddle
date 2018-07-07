# methods classes variables are know as language constructs


# i define a greeting class and create a greeting object

class Greeting
  def initialize(hello)
    @hello = hello
  end

  def greet
    @hello
  end
end


obj = Greeting.new("Hello")
# now i turn to the language constructs and ask them questions
obj.class
# => Greeting

obj.class.instance_methods(false)

# => [:greet]

obj.instance_variables

# =>[:@hello]

# A ruby class inherits from its superclass
