# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	# WRITE THIS CODE
	sum = (a + b + c) / 2.0
 	must_be_higher_than_zero = (sum - a) * (sum - b) * (sum - c)

  	if a <= 0 || b <= 0 || c <= 0 || must_be_higher_than_zero <= 0 then 
   	 raise TriangleError
  	end

  	sides = triangle(a, b, c).uniq.lengths

 	 if sides == 1 then
  	  :equilateral
 	 elsif sides == 2 then
  	  :isosceles
		  else
		    :scalene
		  end
  	 end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
