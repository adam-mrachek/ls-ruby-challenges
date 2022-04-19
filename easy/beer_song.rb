# PROBLEM
# Write a program that can generate the lyrics of the 99 bottles of beer song.
# - Program should be able to generate lyrics for the entire song starting at 99
# - It should be able to accept an argument to start at a specific number.
# - It should be able to accept two arguments: a starting integer and end interger
#   and generate lyrics from first integer and count down to second integer.

# EXAMPLES / TEST CASES
# See test suite for examples and requirements

# DATA STRUCTURES
# Input: Integer(s)
# Output: String(s)
# Processing: Use a range or array to count down from starting integer to ending integer

# ALGORITHM
# Constructor: 
# - Should accept up to 2 arguments: first argument is starting integer, second optional argument the ending integer
# - If no second argument is given, default to 0
# `verse` method:
# - accepts one argument: integer which represents both the starting and ending integers
# - only prints one verse with integer argument representing the number of bottles of beer on the wall
# - initialize new `BeerSong` object, passing the integer argument, `n`, as both arguments into initialize method
# `verses` method:
# - accepts two arguments: starting and ending integers
# - initialize new `BeerSong` object, passing in arguments for starting/ending integers
# - Iterate from starting integer down to ending integer and `print_verse` for each integer
#   - If integer == 1, "bottle" should be singular in first line of verse
#   - If intgeger == 0, second line of verse should be:
#     "Go to the store and buy some more, 99 bottles of beer on the wall"

require 'pry'

class BeerSong
  def initialize(start_number, end_number)
    @start_number = start_number
    @end_number = end_number
    @range = (@start_number..@end_number).to_a.reverse
  end

  def self.verse(verse_number)
    BeerSong.new(verse_number, verse_number).print_lyrics
  end

  def self.verses(start_number, end_number)
    BeerSong.new(start_number, end_number).print_lyrics
  end

  def self.lyrics
    BeerSong.new(99, 0).print_lyrics
  end

  def print_lyrics
    result = []
    @start_number.downto(@end_number) do |num|
      result << print_verse(num)
    end
    result.join("\n")
  end

  def print_verse(number)
    if number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"\
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"\
    elsif number == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number - 1} bottles of beer on the wall.\n"\
    end
  end
end

puts BeerSong.verses(99, 98)