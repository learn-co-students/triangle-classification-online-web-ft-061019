require 'pry'

class Triangle
  attr_accessor :side_a, :side_b, :side_c, :equilateral, :isosceles, :scalene
  
  def initialize(side_a, side_b, side_c)
      
    if side_a.nil? || side_b.nil? || side_c.nil?
      raise TriangleError
    end

    if side_a <= 0 || side_b <= 0 || side_c <= 0
      raise TriangleError
    end

    if (side_a + side_b) <= side_c || (side_b + side_c) <= side_a || (side_c + side_a) <= side_b
      raise TriangleError
    end
    
      @side_a = side_a
      @side_b = side_b
      @side_c = side_c
  end
  
  def kind

    if @side_a == @side_b && @side_b == @side_c && @side_a == @side_c
      return :equilateral
    elsif @side_a != @side_b && @side_b != @side_c && @side_a != @side_c
      return :scalene
    else
      return :isosceles
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle."
    end
  end
end
