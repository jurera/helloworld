class Talker
  def self.say(*args)
    puts "Inside self.say"
    puts "self = #{self}"
    args.each do |arg|
      method_name = ("say_" + arg.to_s).to_sym
      send :define_method, method_name do
        puts arg
      end
    end
  end
end

class MyTalker < Talker
  say :hello
  say :qwe
end

m = MyTalker.new

m.say_hello
m.say_qwe
