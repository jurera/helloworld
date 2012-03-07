class CartesianProduct
	include Enumerable
	def initialize(a_arr,b_arr)
		@a_arr = a_arr
		@b_arr = b_arr 
		@cartp = []
		calc {|a| @b_arr.each{|b| @cartp << [a , b]} }
	end
	def calc
		@a_arr.each{|a| yield a}
	end
	def each
		@cartp.each{|c| yield c}
	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
