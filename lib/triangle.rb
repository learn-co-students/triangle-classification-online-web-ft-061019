require 'pry'
class Triangle
  attr_reader :sides
  def initialize(side1, side2, side3)
    @sides = side1, side2, side3
  end

  def type?
    uniq_sides = self.sides.uniq.count
    if uniq_sides == 1
      :equilateral
    elsif uniq_sides == 2
      :isosceles
    else
      :scalene
    end
  end


  def kind
    triangle?
    type?
  end

  def triangle?
    if self.sides.any? { |side| side <= 0 } || illegal?
        raise TriangleError
    end
  end

  def illegal?
    a, b, c = self.sides
    (a+b <= c) || (b+c <= a) || (c+a <= b)
  end

  class TriangleError < StandardError
    def message
      "Cannot create a triangle with the sides given!"
    end
  end

end
