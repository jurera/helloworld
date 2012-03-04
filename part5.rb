class Class

	def attr_accessor_with_history(*attrs)
 
   
    
    attrs.each do |attr|
    
		attr_name = attr.to_s  		# make sure it's a string
		attr_reader attr_name 				# create the attribute's getter
		attr_reader attr_name+"_history" 	# create bar_history getter
		
		
		class_eval %Q{

		  				@#{attr_name}
				@#{attr_name}_history = Array.new
				@#{attr_name}_history << @#{attr_name}
		 
	  
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

	end

class Foo
	attr_accessor_with_history :bar1
	attr_accessor_with_history :bar


end

f = Foo.new
f.bar = 1
f.bar = 1
#~ f.bar1 =1
print f.bar_history
