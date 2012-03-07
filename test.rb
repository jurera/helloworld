

def test
	arr1=[1,2,3]
	arr1.each{|a| yield a}
end
arr2=["a","b","c"]
test {|i| arr2.each{|b| puts i.to_s+b} }

