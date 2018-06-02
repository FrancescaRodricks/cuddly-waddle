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

  end
end

Book.title_details("Famous Five")