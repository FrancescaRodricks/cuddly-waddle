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
      # super
    end
  end

end

Book.title_details("Famous Five")


# method missing

Book.borrow


Book.sell("New Customer") { "John Doe" }