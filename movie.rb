class Movie
  REGULAR = 0
  CHILDRENS = 1
  NEW_RELEASE = 2

  # title = ninja turtles
  # price_code = 25.00 £
  attr_reader :title, :price_code
  attr_accessor :price
  def initialize(title:, price_code:)
    @title = title
    self.price_code = price_code
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  # override price code setter 
  def price_code=(value)
    @price_code = value
    @price = case @price_code
    when REGULAR
      RegularPrice.new
    when NEW_RELEASE
      NewReleasePrice.new
    when CHILDRENS
      ChildrenPrice.new
    end
  end

  def frequent_renter_points(days_rented)
    (price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end

class RegularPrice
  def charge(days_rented)
    this_amount = 0
    this_amount += 2
    this_amount += (days_rented - 2) * 1.5 if days_rented > 2
    this_amount
  end
end

class NewReleasePrice
  def charge(days_rented)
    this_amount = 0
    this_amount += days_rented * 3
  end
end

class ChildrenPrice
  def charge(days_rented)
    this_amount = 0
    this_amount += 1.5
    this_amount += (days_rented - 3) * 1.5 if days_rented > 3
  end
end
