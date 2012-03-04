class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s  # make sure it's a string
        attr_reader attr_name  # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter
        class_eval %Q{
            def #{attr_name}= (attr_name)
                @attr_name = attr_name
            if @#{attr_name}_history
                    @#{attr_name}_history += [@attr_name]
                else
                    @#{attr_name}_history = [nil, @attr_name]
                end
            end
            
            def #{attr_name}
                @attr_name
            end      
        }
    end
end

class Foo
    attr_accessor_with_history :bar
    attr_accessor_with_history :bar1
end

f = Foo.new
f.bar = "123"
f.bar1 = "qwe123"

print f.bar_history
print f.bar1_history
