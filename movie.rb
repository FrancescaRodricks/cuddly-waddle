class Movie
  REGULAR = 0
  CHILDRENS = 1
  NEW_RELEASE = 2

  # title = ninja turtles
  # price_code = 25.00 £
  attr_reader :title, :price_code
  def initialize(title:, price_code:)
    @title = title
    @price_code =  price_code
  end

  def charge(days_rented)
  	this_amount = 0
    case price_code
    when REGULAR
      this_amount += 2
      this_amount += (days_rented - 2) * 1.5 if days_rented > 2
    when NEW_RELEASE
      this_amount += days_rented * 3
    when CHILDRENS
      this_amount += 1.5
      this_amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
  end

end