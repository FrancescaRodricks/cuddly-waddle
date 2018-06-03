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


