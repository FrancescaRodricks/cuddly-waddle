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

