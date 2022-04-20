# PROBLEM
# Write a program that will take a string of digits and return all possible consecutive
# series of a *specified* length in that string.

# EXAMPLES / TEST CASES
# The string '01234' has the following 3-digit series:
# - 012, 123, 234
# And the following 4-digit series:
# - 0123, 1234
# Asking for a 6-digit series from a 5-digit string should throw an error
# See test suite for additional examples and requirements.

# DATA STRUCTURE
# Input: string (of digits), an integer representing length of series
# Output: Array of arrays containing resulting series
# Processing: Use array to store digits of input string

# ALGORITHM
# Constructor:
# - Initialize `Series` object with one argument: the string of digits
# - Convert string of digits into an array, `@digits`, containing each of the digits as an element. 
# `slices` instance method:
# - accepts one argument: a number, `legnth`, specifying the length of series to create from input string of digits
#   - If `length` is greater than the length of `@digits` throw error
#   - create empty `results` array to store the resulting series
#   - Iterate through @digits array keeping track of index position within array
#     - Stop iterating through array at `@digits - length` index.
#     - For each iteration, create sub-array to store individual series
#     - For index up to `lenth`, add digits to sub-array
#     - Add sub-array to `results` array
#   - Return `results` array

require 'pry'

class Series
  def initialize(digits_string)
    @digits = digits_string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    results = []
    index = 0

    # Note, could also use ruby Enumerable#each_cons(n) instead of this while loop.
    while index <= (@digits.size - length) do
      range = (index..index+(length-1)).to_a 
      series = []
      range.each do |num|
        series << @digits[num]
      end
      results << series
      index += 1
    end
    results
  end

  def validate_length(length)
    raise("invalid series length") if length > @digits.size
  end
end

series = Series.new('01234')
p series.slices(2)