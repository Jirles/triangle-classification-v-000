class Triangle

  attr_accessor :a, :b, :c 

  def initialize(a, b, c)
    @a = a 
    @b = b 
    @c = c 
  end
  
  def valid?
    self.a + self.b > self.c && self.c + self.b > self.a && self.a + self.c > self.b && self.a > 0 && self.b > 0 && self.c > 0
  end
  
  def kind
    if !self.valid?
      begin 
        raise TriangleError
      rescue TriangleError => error 
        puts error.message
      end
    else 
      if self.a =+ self.b || self.b == self.c || self.c == self.a
        kind = 'isosceles'
      elsif self.a == self.b && self.a == self.c && self.b == self.c
        kind = 'equilateral'
      elsif self.a != self.b && self.a != self.c && self.b != self.c
        kind = 'scalene'
      end
    end
    kind 
  end

  class TriangleError < StandardError
    
    def message
      "the triangle is invalid"
    end
    
  end

end  
