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

require 'pry'

class RomanNumeral
  DECIMAL_TO_ROMAN = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XL',
    50 => 'L',
    60 => 'LX',
    70 => 'LXX',
    80 => 'LXX',
    90 => 'XC',
    100 => 'C',
    200 => 'CC',
    300 => 'CCC',
    400 => 'CD',
    500 => 'D',
    600 => 'DC',
    700 => 'DCC',
    800 => 'DCCC',
    900 => 'CM',
    1000 => 'M'
  }

  def initialize(number)
    @number = number
  end

  def get_thousands_numeral(digit)
    return DECIMAL_TO_ROMAN[1000] * digit if digit
    ''
  end

  def get_hundreds_numeral(digit)
    if digit && digit != 0
      return DECIMAL_TO_ROMAN[digit * 100]
    else
      ''
    end
  end

  def get_tens_numeral(digit)
    if digit && digit != 0
      return DECIMAL_TO_ROMAN[digit * 10]
    else
      ''
    end
  end

  def get_last_numeral(digit)
    return DECIMAL_TO_ROMAN[digit] unless digit == 0
    ''
  end

  def to_roman
    digits = @number.digits
    last = digits[0]
    tens = digits[1]
    hundreds = digits[2]
    thousands = digits[3]
    result = ''

    # binding.pry

    result += get_thousands_numeral(thousands)
    result += get_hundreds_numeral(hundreds)
    result += get_tens_numeral(tens)
    result += get_last_numeral(last)
    result
  end
end

number = RomanNumeral.new(402)
p number.to_roman