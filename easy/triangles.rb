# PROBLEM
# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
# - An equilateral triangle has all three sides the same length
# - An isosceles triangle has exactly two sides of the same length
# - A scalene triangle has all sides of different lengths
# - All sides must be of length > 0
# - The sum of the lengths of any two sides must be greater than the length of the third side

# EXAMPLES / TEST CASES
# See `triangles_test.rb`
# According to test cases, program must have at least two methods:
# - An initialize method accepting 3 side lengths
#   - An `ArgumentError` must be raised if side lengths do not represent valid triangle. For example,
#     - a side length <= 0
#     - side lengths taken together don't describe valid triangle according to descriptions above
# - A `kind` instance method that returns a string representing the type of triangle

# DATA STRUCTURE
# Possibly use array to iterate through sides/side lengths to determine type and validity of triangles

# ALGORITHM
# Initialize a new `Triangle` object that accepts 3 arguments, each argument reprsenting the length of each side
# - Check to see if all sides have a length > 0
#   - If not, raise `ArgumentError`
#   - Create `valid_triangle?` method to check lengths.
#     - `valid_lengths?` method calls `all_positive?` method to check for lengths <= 0
# - Check to see if the sum of the sum of the lengths of any two sides is greater than the third side
#   - If not, raise `ArgumentError`
#   - `valid_triangle?` method calls `valid_lengths?` method to check that sum of any two sides is greater than third side
#      - `valid_lengths?` method algorithm:
#         - Get sum of all three sides and store in `total_length` variable.
#         - Iterate through each side and compare length to (`total_length` - self.length)
#           - If all sides are less than (`total_length` - self.length), return true
#           - Else, return false
# - Create a `kind` method that examines the three given lengths and returns string representation of one of the three
#   triangle types. 

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]

    valid_triangle?
  end

  def all_positive?
    @sides.all? { |length| length > 0}
  end

  def valid_lengths?
    valid = true
    total_length = @sides.sum

    @sides.each do |side|
      if side >= (total_length - side)
        valid = false
      end
    end

    valid
  end

  def valid_triangle?
    raise ArgumentError.new("invalid side lengths") unless all_positive? && valid_lengths?
  end

  def kind
    if @sides.uniq.count == 1
      "equilateral"
    elsif @sides.uniq.count == 3
      "scalene"
    elsif @sides.uniq.count == 2
      "isosceles"
    end
  end
end