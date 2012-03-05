require 'test/unit'
require './hw2_p1.rb'


class CurrencyTest < Test::Unit::TestCase 

  def dollar_to_other_currency_test

	arr =  [1.yen]
	arr += [1.euro]
	arr += [1.rupee] 
        
    assert_equal [0.013,1.292,0.019], arr

  end 
  
 end
