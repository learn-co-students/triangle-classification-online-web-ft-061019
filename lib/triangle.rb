require 'pry'
class Triangle
attr_accessor :length1, :length2, :length3
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3 
  end

  def kind
   
   validate_triangle
    
    if length1 == length2 && length2 == length3 && length1 == length3
      :equilateral
    elsif length1 == length2 || length2 == length3 || length3 == length1
      :isosceles 
    else 
      :scalene
    end 
  
  end
  
  def validate_triangle 
    real_triangle = [(length1 + length2 > length3), (length1 + length3 > length2), (length2 + length3 > length1)]
    [length1, length2, length3].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)

  end 

  class TriangleError < StandardError 
  
  end
end


