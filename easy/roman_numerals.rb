# PROBLEM
# Write a program that converts modern decimal numbers to their Roman numeral counterparts
# Do not need to handle number greater than 3000 since Romans rarely went any higher

# EXAMPLES / TEST CASES
# See `roman_numerals_test.rb`
# Program must have two methods:
#  - initialize method that accepts integer argument
#  - a `to_roman` method that converts the integer argument into roman number counterpart as a string

# DATA STRUCTURE
# Input: integer
# Output: string
# Conversion: may need hash to act as a key for decimal > roman numeral conversion
# variables to hold values of each integer position (ie. singles, tens, hundreds, and thousands)

# ALGORITHM
# Initialize new `RomanNumeral` object setting single integer argument to instance variable `number`
# Set constant `DECIMAL_TO_ROMAN` constant to hash containing decimals as keys and corresponding roman numerals as values
# Initialize local variable `result` and set to empty string to store result
# create `to_roman` method to convert decimal to roman
#  - create 4 local variables: single, tens, hundreds, and thousands to store value of each position
#  - using 4 local variables and conversion hash, determine corresponding roman for each position
#  - add result of each conversion to `result` varible
#  - return result variable

class RomanNumeral
  DECIMAL_TO_ROMAN = [
    {1000 => 'M'}, {900 => 'CM'}, {500 => 'D'}, {400 => 'CD'}, {100 => 'C'},
    {90 => 'XC'}, {50 => 'L'}, {40 => 'XL'}, {10 => 'X'}, {9 => 'IX'},
    {5 => 'V'}, {4 => 'IV'}, {1 => 'I'}
  ]

  def initialize(number)
    @number = number
  end

  def to_roman
    result = ''
    convert = @number

    DECIMAL_TO_ROMAN.each do |conversion|
      conversion.each_pair do |decimal, numeral|
        multiplier, remainder = convert.divmod(decimal)
        if multiplier > 0
          result += (numeral * multiplier)
        end
        convert = remainder
      end
    end

    result
  end
end