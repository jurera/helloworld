def palindrome?(string)
  string = string.gsub(/\W/,'').downcase
  string == string.reverse
end

print "A man, a plan, a canal -- Panama\n"
print palindrome?("A man, a plan, a canal -- Panama")
print "\n"
print "Madam, I'm Adam!\n"
print palindrome?("Madam, I'm Adam!")
print "\n"
print "Abracadabra\n"
print palindrome?("Abracadabra") 
print "\n"

def count_words(string)
  string.downcase.scan(/\w+/).inject(Hash.new(0)) {|h,i| h[i] += 1; h }
end

print "A man, a plan, a canal -- Panama\n"
print count_words("A man, a plan, a canal -- Panama")
print "\n"
