# PROBLEM
# Write a program that can tell whether a number is perfect, abundant, or deficient.
#  - Perfect numbers have an Aliquot sum that is equal to the original number.
#  - Abundant numbers have an Aliquot sum that is greater than the original number.
#  - Deficient numbers have an Aliquot sum that is less than the original number.

# EXAMPLES / TEST CASES
# See test suite in `perfect_number_test.rb` for requirements.
# `PerfectNumber` class should have a class method that accepts an integer argument
# and return the type of number: abundant, perfect, or deficient.

# DATA STRUCTURES
# Input: Integer
# Output: String
# Either an array or integer to track and sum divisors of given number

# ALGORITHM
# Create `PerfectNumber` class
# Create a `process` class method that accepts a single integer argument
# Create `sum` variable to track the sum of divisors of given number
# From 1 up to given number, identify divisors and add divisors to `sum` variable
# If `sum` is greater than number, then return "abundant"
# If `sum` is equal to the number, then return "perfect"
# If `sum` is less than the number, then return "deficient"

class PerfectNumber
  def self.classify(number)
    raise StandardError("positive numbers only") if number < 1

    sum = self.sum_divisors(number)
    
    if sum > number
      "abundant"
    elsif sum < number
      "deficient"
    else
      "perfect"
    end
  end

  def self.sum_divisors(number)
    sum = 0

    1.upto(number - 1) do |num|
      if number % num == 0
        sum += num
      end
    end
    sum
  end
end