require_relative 'movie.rb'
require_relative 'rental.rb'

class Customer
  attr_accessor :rentals
  def initialize(name:)
    @name = name
    @rentals = []
  end

  def add_rental(rented)
    @rentals << rented
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |rental|
      frequent_renter_points += rental.calculate_frequent_renter_points
      # show figures for this rental
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
      total_amount += rental.charge
    end
    # add footer lines
    result += "Amount owed is #{total_amount.to_s}\n"
    result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    puts "ORIGINAL AND REFACTORED RESULTS ARE THE SAME ? #{result == "Rental Record for Francesca\n\tShrek\t4.5\nAmount owed is 4.5\nYou earned 1 frequent renter points"}"
    result
  end

end

movie = Movie.new(title: 'Shrek', price_code: 1)
movie2 = Movie.new(title: 'Robin Hood', price_code: 1)
rental = Rental.new(movie: movie, days_rented: 5)
rental2 = Rental.new(movie: movie2, days_rented: 10)
customer = Customer.new(name:'Francesca')
customer.rentals << rental
customer.rentals << rental2
p customer.statement


