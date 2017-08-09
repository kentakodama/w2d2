module Something

  def print_something(phrase)
    puts "Intercepted!"
  end
end


class Parent
  include Something
  def initialize

  end

  def print_something(phrase)
    super
    puts phrase
  end
end



class Child < Parent


end


kid = Child.new
dad = Parent.new
kid.print_something('test')
