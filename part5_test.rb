require 'test/unit'
require './part5.rb'

   class FooTest
      attr_accessor_with_history :teste
    end
    
    class FooMultiple
      attr_accessor_with_history :bar1
      attr_accessor_with_history :bar2
      attr_accessor_with_history :bar3
    end

class AccesorHistoryTest < Test::Unit::TestCase 

 

  def test_attr_accessor_with_history
    f = Foo.new
    f.bar = 1
    f.bar = 2
        
    assert_equal [nil,1,2], f.bar_history

  end 
  
  
  def test_attr_accessor_with_history_forget_before
    f = Foo.new
    f.bar = 1
    f.bar = 2
    f = Foo.new
    f.bar = 1
    f.bar = 2
    f = Foo.new
    f. bar = 4
    f.bar_history
    
    assert_equal [nil,4], f.bar_history

  end 
  
  
  def test_attr_accessor_with_history_multiple
    f = Foo.new
    g = Foo.new
    
    f.bar = 1
    g.bar = "qwe"
    
    f. bar = 4
    g.bar = 3
    f.bar_history
    
    assert_equal [nil,1,4], f.bar_history
    assert_equal [nil,"qwe",3], g.bar_history


  end 
    
  def test_attr_accessor_with_different_vars
    f = Foo.new
    f.bar = 1
    f.bar = "qwe"
    f.bar = [2,"qwe","asd"]
    f.bar_history
    
    assert_equal [nil,1,"qwe",[2,"qwe","asd"]], f.bar_history
    

  end 

  def test_attr_accessor_with_new_class
   
    f = FooTest.new
    f.teste = 1
    f.teste = 4
    f.teste_history
    
    assert_equal [nil,1,4], f.teste_history
    

  end 
  
  def test_attr_accessor_with_nil
   
    f = FooTest.new

    
    assert_equal [nil], f.teste_history
    

  end 
  
    def test_attr_accessor_with_multiple_1
   
    f = Foo.new
    f.bar = "qwe"
    f.bar = 1
    f.bar = 4
    f = Foo.new
    

    
    assert_equal [nil], f.bar_history
    

  end 
   def test_attr_accessor_with_multiple_attr_in_class
  
    f = FooMultiple.new
    f.bar1 = 1
    f.bar2 = 2
    f.bar3 = 1
    f.bar1 = 1
    f.bar2 = 2
    f.bar3 = 1
    f.bar1 = 1
    f.bar2 = 2
    f.bar3 = 1
    f.bar1 = 1
    f.bar2 = 2
    f.bar3 = 1
    
    assert_equal [nil,1,1,1], f.bar1_history
    assert_equal [nil,2,2,2], f.bar2_history
    assert_equal [nil,1,1,1], f.bar3_history  
  
  end
  
end

