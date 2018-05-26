class Movie
  REGULAR = 0
  CHILDREN = 1
  NEW_RELEASE = 2

  # title = ninja turtles
  # price_code = 25.00 £
  def initialize(title:, price_code:)
    @title = title
    @price_code =  price_code
  end
end