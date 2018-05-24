class Person
  [:first_name, :last_name, :age].each do |trait|
    attr_accessor trait
  end
end

def self.total_up(*args)
  args.inject(10) {|sum, arg| sum += arg }
end

p total_up(1,2,3,4,5)

def self.sum_with_default_zero(*args)
  args.inject(0) {|sum, arg| sum += arg }
end

p sum_with_default_zero(1,2,3,4,5)

def self.sum_with_reduce(*args)
  args.reduce(0) {|sum, arg| sum += arg }
end

p sum_with_reduce(1,1,1,1)

def self.print_my_name
  p __method__
end

print_my_name


Date.today.to_s