class Triangle
  
  attr_accessor :adjacent, :opposite, :hypotenuse

  def initialize(adjacent, opposite, hypotenuse)
    @adjacent = adjacent
    @opposite = opposite
    @hypotenuse = hypotenuse
  end 

  def kind 
    if adjacent <= 0 || opposite <= 0 || hypotenuse <= 0 
      raise TriangleError
    elsif adjacent + opposite <= hypotenuse || opposite + hypotenuse <= adjacent || adjacent + hypotenuse <= opposite 
      raise TriangleError 
    elsif adjacent == opposite && opposite == hypotenuse 
      :equilateral 
    elsif adjacent == opposite || opposite == hypotenuse || adjacent == hypotenuse 
      :isosceles 
    else 
      :scalene
    end 
  end 

  class TriangleError < StandardError
  end
end 


adjacent              opposite 
                .
               . .
              .   .
             .     . 
            .       .
          .          .
        . . . . . . . .
            hypotenuse        