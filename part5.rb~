class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    
    
    class_eval %Q{
      
      def #{attr_name}_history
        @#{attr_name}_history
      end
      
      def #{attr_name}_history=(value)
      
                        
	      @#{attr_name}_history = value
	    end
     
      def #{attr_name}
        @#{attr_name}
      end
      
      def #{attr_name}=(value)
        
        @#{attr_name}_history << value
	      @#{attr_name} = value
	    end
	    

        
    }
  end

end

class Foo
  def initialize()
    @bar 
    @bar_history = Array.new
    @bar_history << @bar
  end

  attr_accessor_with_history :bar
end

f = Foo.new
print f.bar = 1, "\n"
print f.bar = 2, "\n"
print f.bar_history, "\n" # => if your code works, should be [nil,1,2]
