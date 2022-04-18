# PROBLEM:
# Write a program that, given a natural number and set of one or more other numbers,
# can find the sum of all the multiples in the set that are less than the first number.
# If the set of numbers is not given, use a default of 3 and 5.
# - A natural number is a positive integer (whole number) 1, 2, 3 etc and sometimes zero as well

# EXAMPLES / TEST CASES
# Given a natural number of 20 and set of multiples 3 and 5, we should get 3, 5, 6, 9, 12, 15, 18.
# The sum of the multiples is 78.
# Also see test suite for more examples and requirements.

# DATA STRUCTURES
# Input: integers
# Output: integer
# Processing: array to hold set of input numbers. Second array to hold resulting multiples.
# Also might use an array to hold range of numbers up to the given natural number

# ALGORITHM
# - Create variable called `range` and set to array containing integers 1 upto given natural number - 1
# - Create variable `multipliers`:
#    - if multipliers given, set `multipliers` to array containing multipliers
#    - else, set `multipliers` to array containing 3 and 5.
# - Create variable `multiples` and set equal to empty array to store resulting integer multiples
# - For each integer in `multipliers` array, iterate through `range` array:
#    - If `range` % `multiplier` == 0, then add `range` number to `multiples` array
#    - else, move to next `range` integer
# - After iterating through all integers in `range` array, sum integers in `multiples` array and return value.

require 'pry'

class SumOfMultiples
  attr_reader :range, :multipliers

  def initialize(*multipliers)
    @multipliers = multipliers
  end

  def self.to(number)
    @range = (1..number-1).to_a 
    self.new(3, 5).find_sum(@range)
  end

  def to(number)
    @range = (1..number-1).to_a 
    find_sum(@range)
  end

  def find_sum(range)
    multiples = find_multiples(range)
    multiples.sum
  end

  def find_multiples(range)
    result = []

    range.each do |number|
      if multipliers.any?{ |multiplier| number % multiplier == 0}
        result << number
      end
    end
    result
  end
end