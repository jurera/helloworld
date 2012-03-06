# metaprogramming to the rescue!

class Numeric
 	

	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	def method_missing(method_id)
    
		singular_currency = method_id.to_s.gsub( /s$/, '')
    
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
			
			super
		end
	end
	
	
	def in(currency)

		exchange_currency = currency.to_s.gsub( /s$/, '')
		if @@currencies.has_key?(exchange_currency)			
			self/@@currencies[exchange_currency]
		else
			super
		end

	end
end


#~ puts 5.rupees.in(:yen)
#~ puts 5.rupees.in(:yen).between?(7.2, 7.4)
#~ puts 2.dollar.in(:yen)

class String
	def palindrome?()
		
		string = self.gsub(/\W/,'').downcase
		string.downcase.to_s == string.reverse.to_s
	end
end

#~ puts "foo".palindrome?
#~ puts "ana".palindrome?
#~ puts "foo".palindrome?

module Enumerable
	def palindrome?()
		arr = self.map { |k| k}.flatten(1).map { |i| i.to_s}.join.gsub(/\W/,'').downcase
		arr == arr.reverse		
	end
end

puts (1..2).palindrome?
puts [1,2,3,2,1].palindrome?
puts [1,2,3,2].palindrome?
puts Hash["a" => "a", "b" => "b", "c"=>"a"].palindrome?
puts "a man a plan a canal panama".palindrome?

