# Class Definitions - Chapter 5
# class macros- methods that modify classes


# around aliases - methods that wrap additional code around other methods

# singleton classes -  one of ruby's most elegant features :)

#  \o/ \o/ \o/
#   -   -   -   cute :D
#  /o\ /o\ /o\

# 1. Class Definitions


class MyClass

  puts 'hello world'

end


# class definitions retuens the value of the last statement like methods

result = class Sunday
  "#{self} - PRINT ME"
end

puts result



# The current class - in a ruby program you always have a current object self

class C
  def m1
    def m2
    end
  end
end


class D < C ; end


obj = C.new

# puts obj.m2
puts obj.m1

puts C.instance_methods(false)



# how to open a class if you dont know its name ?

def add_a_method_to(a_class)
  # add method to a_class 
end


# cant call constantize its a rails method

# use class_eval

def add_a_method_to(a_class)

  a_class.class_eval do
    # creates  an instance method on the class
    # class_eval reopens a class like how class does
    def action
      puts "eats Cake"
    end
  end

end

puts x = add_a_method_to(String)
"Francesca".action


# use instance_eval to open an object that is not a class
# use class_eval to open a class and define methods with def

# class instance variables


class InstanceVariables
  @var = 1

  def self.read
    @var
  end

  def read
    @var
  end

  def write
    @var = 2
  end
end

puts InstanceVariables.read
# 1
puts InstanceVariables.new.read
# nil
puts InstanceVariables.new.write
# 2
puts InstanceVariables.read
# 1 



class Loan
  attr_reader :book, :time
  def initialize(book)
    @book = book
    @time = Time.now
  end
end


loan = Loan.new('Sydney Sheldon')
puts loan.book
puts loan.time


# how to test a method like this that has a time changing all the time ?

class Loan
  attr_reader :book, :time
  def initialize(book)
    @book = book
    @time = Loan.set_time.now
  end

  def self.set_time
    @time_set || Time
  end
end

l = Loan.new('Book')

l.book

l.time

# always a changing time ?

# see the magic

l.instance_eval do
  @time_set = Time.now
end

# all the below prints should print the same time
puts l.time
puts l.time
puts l.time


# YAY that worked :D well done!


# Singleton Methods - methods that exist only on a single object are called singleton methods


class Paragraph
  attr_reader :str
  def initialize(str)
    @str = str
  end
end


# I want to add title only to an instance of the paragraph class


p = Paragraph.new("new para")

def p.title?
  # puts self
  # puts p
  self.str.upcase == self.str
end

puts p.title?

puts p.singleton_methods

p2 = Paragraph.new('para 2')

puts "#{p2.singleton_methods}--NO METHODS"


# class methods are singleton methods

# lets prove this

class SingletonMethods

  def self.singleton
  end

end

puts SingletonMethods.methods(false)

puts SingletonMethods.singleton_methods

# class macros

# attr_accessor are class macros; they can be defined on a class or module

# module example

module A
  attr_accessor :name
end

class B
  include A
  def initialize(name)
    @name = name
  end
end

b  = B.new('Francheska')

puts b.name