require_relative './movie.rb'
class Rental
  attr_accessor :movie, :days_rented
  def initialize(movie:, days_rented:)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    # move charge logic to movie class
    movie.charge(days_rented)
  end

  def calculate_frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end
