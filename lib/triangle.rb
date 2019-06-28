class Triangle

  attr_accessor :a, :b, :c
  
  def initialize (a, b, c)
    @a = a
    @b = b
    @c = c
    @array = [@a, @b, @c]
  end

  def kind
    if self.triangle?
      if self.equalateral
        return :equilateral
      elsif self.scalene
        return :scalene
      elsif self.isosceles
        return :isosceles
      end
    else
      raise TriangleError
    end
  end

  def triangle?
    check1 = @a + @b > @c
    check2 = @a + @c > @b
    check3 = @b + @c > @a
    check1 && check2 && check3
  end

  def equalateral
    @array.uniq.length == 1
  end

  def isosceles
    @array.uniq.length == 2
  end

  def scalene
    @array.uniq == @array
  end
  
  class TriangleError < StandardError
    # triangle error code
  end
end
