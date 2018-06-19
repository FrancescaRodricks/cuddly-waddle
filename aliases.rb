# around aliases

# alias_method class methods

class Alias
  def self.duplicate_me
    'i can be duplicated'
  end
  class << self
    alias_method :duplicated, :duplicate_me
  end
end

puts Alias.duplicate_me

puts Alias.duplicated


# alias methods instance methods


class Alias

  def dup_1
    puts "dup 1"
  end

  alias_method :dup_2, :dup_1
end


puts Alias.new.dup_2

# alias and override original method

class String
  alias_method :length_ , :length

  def length
    length_ > 5 ? '>5' : '<5'
  end
end

puts "12345".length_

puts "12345678".length_
