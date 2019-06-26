class Triangle
  attr_accessor :side1, :side2, :side3, :check_arr

  def initialize(side1, side2, side3)
    self.side1 = side1.to_f
    self.side2 = side2.to_f
    self.side3 = side3.to_f
    self.check_arr = [self.side1, self.side2, self.side3]
  end

  def not_violate_inequality?
    # See video here on how to do the checking for triangle inequality https://www.mathwarehouse.com/geometry/triangles/triangle-inequality-theorem-rule-explained.php
    # basically, for the triangle to not violate the triangle inequality rule it has to pass 3 tests:
    # A+B > C ?
    # B+C > A ?
    # A+C > B ? 
    check1 = self.side1 + self.side2 > self.side3
    check2 = self.side2 + self.side3 > self.side1
    check3 = self.side1 + self.side3 > self.side2 
    check1 && check2 && check3 ? true : false
  end
  
  def is_equilateral? 
    #This checks to see if all the array elements are the same by comparing each element to the first element in the array.
    self.check_arr.all? {|element| element == check_arr[0]}
  end

  def is_isosceles? 
    #So by putting the sides into an array, I can then use array method uniq.  uniq will return an array of 2 items if 2 of the 3 items are uniq (it elimnated the dupe) so anytime uniq returns an array with a length of 2 it means that there are 2 equal sides no matter the placement of them in the array.
    check_arr.uniq.length == 2
  end

  def is_scalene? 
    #So if I compare an array of all the sides to a uniq version of the array, and they are the same, then it is scalene
    check_arr == check_arr.uniq
  end

  def kind
    my_kind = nil
    if is_equilateral? && not_violate_inequality?
      my_kind = :equilateral
    elsif is_isosceles? && not_violate_inequality?
      my_kind = :isosceles
    elsif is_scalene? && not_violate_inequality?
      my_kind = :scalene
    else
      raise TriangleError
    end
  end
  
  class TriangleError < StandardError 
  end


end

#Test for my methods that are not being tested in rspec.  Uncomment and then run "ruby lib/triangle.rb" to see them.
#triangle1 = Triangle.new(4, 8, 3)
#puts "(#{triangle1.side1}, #{triangle1.side2}, #{triangle1.side3}) not an inequality violator? #{triangle1.not_violate_inequality?}"
#triangle2 = Triangle.new(3, 3, 3)
#puts "(#{triangle2.side1}, #{triangle2.side2}, #{triangle2.side3}) not an inequality violator? #{triangle2.not_violate_inequality?}"
#puts "(#{triangle2.side1}, #{triangle2.side2}, #{triangle2.side3}) is equilateral? #{triangle2.is_equilateral?}"
#puts "(#{triangle2.side1}, #{triangle2.side2}, #{triangle2.side3}) is scalene? #{triangle2.is_scalene?}"
#puts "(#{triangle1.side1}, #{triangle1.side2}, #{triangle1.side3}) is scalene? #{triangle1.is_scalene?}"
#triangle3 = Triangle.new(6, 6, 4)
#puts "(#{triangle1.side1}, #{triangle1.side2}, #{triangle1.side3}) is isosceles? #{triangle1.is_isosceles?}"
#puts "(#{triangle3.side1}, #{triangle3.side2}, #{triangle3.side3}) is isosceles? #{triangle3.is_isosceles?}"