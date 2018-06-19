# use instance_eval when you want to change self only
# 
class A
end

a1 = A.new


a2 = A.new


a1.instance_eval do
  def print_me
    puts "ME"
  end
end

a1.print_me

a2.respond_to? :print_me




# class_eval
# adds a method to the class so modifies self and the class

class B
end


b1 = B.new

b2 = B.new

b1.class.class_eval do
  def print_two
    puts 2
  end
end

b1.print_two
# => 2
b2.print_two
# => 2


