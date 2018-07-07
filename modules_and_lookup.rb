# modules and lookup

# module
# class include module
# class inherit from class

# module

module M1
  def method1
    puts 'M1method'
  end
end

class C
  include M1
end

class D < C ; end

D.ancestors
#  => [D, C, M1, Object, Kernel, BasicObject]


# preped a module



