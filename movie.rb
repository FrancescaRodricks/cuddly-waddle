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
end