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
    (movie.price_code == ::Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
