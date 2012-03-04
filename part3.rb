class Array

   def find_dups
      inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select { |k,v| v > 1 }.collect { |x| x.first }
   end


   # Based on hungryblank's version in the comments
   # see http://www.ruby-forum.com/topic/122008

   def find_dups2
      uniq.select{ |e| (self-[e]).size < self.size - 1 }
   end
def combine_anagrams(words)
    
    print anagrams = words.group_by { |word| word.chars.sort }.values
    
   
end

words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']

combine_anagrams(words) 


     
    #print words.map {|word| word.downcase.split(//).sort.join}.select{|w| w == "acrs"}
    
    
  
