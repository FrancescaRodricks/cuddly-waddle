# dynamically defining methods

class Book
  # define class methods dynamically
  class << self
  properties = ['title', 'description', 'author']

    properties.each do |property|
      define_method("#{property}_details") do |args|
        puts "Start of the method"
        puts args
        puts "end of the method"
      end
    end

    def method_missing(method_name, *arguments, &block)
      puts "#{method_name} with #{arguments} #{block.call if block_given?} not defined"
    end
  end

end

Book.title_details("Famous Five")


# method missing

Book.borrow


Book.sell("New Customer") { "John Doe" }

# different ways of invoking a proc
proc = Proc.new { |x| puts x }
proc.call(2)
proc.(2)
proc[2]
proc  === 2



less_than_five = Proc.new { |number|  number > 0 && number < 5 }
greater_than_five = Proc.new  { |number| number > 5 }

(0..10).each do |number|
  case number
  when less_than_five
    puts "Less: #{number} "
  when greater_than_five
    puts "Greater: #{number} "    
  end
end

d = Proc.new { puts "hi" }


class A
  def self.invoke_proc(p)
    p.call
  end
end

A.invoke_proc(d)



# add fields dynamically to a model


class Model
  attr_reader :fields
  @@all_fields = []   #class variable can be accessed inside of class << self
  class << self
    def field(field)
      @@all_fields << field
      # attr_accessor field
      define_method field do
        instance_variable_get("@#{field}")
      end

      define_method("#{field}=") do |arg|
        instance_variable_set("@#{field}", arg)
      end
    end
  end


  def name=name
    @name = name
  end

  def initialize
    @fields = @@all_fields
  end
end

class Account < Model
  field :account_type
  field :account_number
  field :customer_name
end

a = Account.new


a.account_number = 1234

a.account_type = 'Current A/C'

a.customer_name = 'Fran'

puts a.inspect

puts a.customer_name

puts a.fields

puts a.singleton_class.public_methods(false)