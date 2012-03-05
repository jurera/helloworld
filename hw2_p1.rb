# metaprogramming to the rescue!

class Numeric
 	
 	@@singular_currency
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	def method_missing(method_id)
    
		@@singular_currency = method_id.to_s.gsub( /s$/, '')
    
		if @@currencies.has_key?(@@singular_currency)
			self * @@currencies[@@singular_currency]
		else
			@@singular_currency = nil
			super
		end
	end
	
	
	def in(currency)
	
		if @@singular_currency
			print @@singular_currency
			print exchange_currency = currency.to_s.gsub( /s$/, '')
			print self
		else
			super
		end
		@@singular_currency = nil

	end
end


puts 2.yens.in(:euro)
puts 2.dollar.in(:qwes)


