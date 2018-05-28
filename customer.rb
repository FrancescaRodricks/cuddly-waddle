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
      frequent_renter_points += calculate_frequent_renter_points(frequent_renter_points, rental)
      # show figures for this rental
      result += "\t" + rental.movie.title + "\t" + amount_for(rental).to_s + "\n"
      total_amount += amount_for(rental)
    end
    # add footer lines
    result += "Amount owed is #{total_amount.to_s}\n"
    result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    puts "ORIGINAL AND REFACTORED RESULTS ARE THE SAME ? #{result == "Rental Record for Francesca\n\tShrek\t4.5\nAmount owed is 4.5\nYou earned 1 frequent renter points"}"
    result
  end

  def calculate_frequent_renter_points(frequent_renter_points, rental)
    (rental.movie.price_code == ::Movie::NEW_RELEASE && rental.days_rented > 1) ? 2 : 1
  end

  def amount_for(rental)
    this_amount = 0
    case rental.movie.price_code
    when ::Movie::REGULAR
      this_amount += 2
      this_amount += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
    when ::Movie::NEW_RELEASE
      this_amount += rental.days_rented * 3
    when ::Movie::CHILDRENS
      this_amount += 1.5
      this_amount += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
    end
  end
end

movie = Movie.new(title: 'Shrek', price_code: 1)
rental = Rental.new(movie: movie, days_rented: 5)
customer = Customer.new(name:'Francesca')
customer.rentals << rental
p customer.statement


