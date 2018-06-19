class A
	class << self
		attr_accessor :apple
	end
end


puts A.apple = 'apple'

puts A.apple