# PROBLEM
# Given an octal input string, the program should produce a decimal output. Invalid input should be treated as octal 0.
# Decimal is a base-10 system:
#  - 233 decimal example:
#    - 2*10^2 + 3*10^1 + 3*10^0
#    = 2*100  + 3*10   + 3*1
# Octal numbers are similar, but use a base-8 system:
#  - 233 octal example:
#    - 2*8^2 + 3*8^1 + 3*8^0
#    = 2*64  + 3*8   + 3*1
#    = 128   + 24    + 3
#    = 155

# EXAMPLES / TEST CASES
# See test suite in octal_test.rb for requirements.
# An `Octal` object should be initialized accepting one argument - the string octal to be converted to decimal.

# Data Structures
# Input: String representing the octal
# Output: Integer represeting the decimal conversion
# Use an array for iterating through each digit of octal number input

# Algorithm
# Split input string octal into individual digits and store in array
# Iterate through array and convert string digits to integers
# Iterate through array and perform base-10 calculation on digits
#  - To do this, might be easiest to sort array from smallest to largest so we can use index `n` in `10^n`
# Calculate the sum of integers after base-10 calculation and return value

class Octal
  attr_accessor :number

  def initialize(str)
    @number = str
  end

  def octal_to_decimal
    digits = number.to_i.digits
    digits.map.with_index do |digit, i|
      digit * (8**i)
    end
  end

  def to_decimal
    return 0 unless valid_input?(number)
    octal_to_decimal.sum
  end

  def valid_digit?(digit)
    [0, 1, 2, 3, 4, 5, 6, 7].include?(digit)
  end

  def valid_input?(num)
    num.chars.all? { |n| n =~ /[0-7]/ }
  end
end

p Octal.new('17').to_decimal
