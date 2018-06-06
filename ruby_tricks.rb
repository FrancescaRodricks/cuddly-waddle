# override fixnum class + method

class Fixnum
  def +(operand)
    10
  end
end


class User
  def name=(name)
    @name=name
  end

  def name
    @name
  end
end

me = User.new

me.name = 'Acsecnarf'

# singlton class
def me.age
  30
end


me.age


you = User.new

you.age



me.singleton_class.instance_methods(false)
 # => [:age] 
you.singleton_class.instance_methods(false)
 # => [] 

# this is a class with two methods. status . One is an instance method and the other is a class method.
class User
  def self.status
    :hmm
  end

  def status
    :admin
  end
end

# now if I wanted to use the same method but define it just once ?
# can use this pretty cool feature call Forwardable that allows you to deligate methods
# lets reopen the user class and define a class method and deligate it to be an instance method.

require 'forwardable'

class User
  extend Forwardable

  # deligates class to instance method
  def_delegator self, :mobile_number

  def self.mobile_number
    987654321.to_s
  end

end

User.mobile_number
User.new.mobile_number



