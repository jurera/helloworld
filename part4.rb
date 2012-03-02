class Dessert

  def initialize(name,calories)
    @name = name
    @calories = calories
  end
  
  attr_accessor :name
  attr_accessor :calories
  
  def healthy?
    calories < 200
  end
  
  def delicious?
    true
  end

end

class JellyBean < Dessert

   
  
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  attr_accessor :flavor
  
  def delicious?
     @flavor != "black licorice" 
  end  
end


qwe = JellyBean.new("melona", 201, "black licorice")
qwe.calories = 12
print qwe.name,"\n"
print qwe.healthy?,"\n"
qwe.name = "Limona"
print qwe.name,"\n"
print qwe.flavor,"\n"
qwe.flavor = "red"
print qwe.delicious?,"\n"



