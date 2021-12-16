# PROBLEM
# Write a program that takes a word and a list of possible anagrams and selects the correct sublist
# that contains the anagrams of the word. For example, given the word "listen" and a list of candidates like
# "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets".

# EXAMPLES / TEST CASES
# See test suite in `anagram_test.rb` for exact rules.
# Program should initialize a new `Anagram` object that accepts a string argument representing primary word.
# Program should have a `match` method that accepts an array containing a list of candidate words and
#   returns an array of matching anagram words.
# Anagrams are case insensitive.

# DATA STRUCTURES
# Input: 
#  - string when initializing a new `Anagram` object.
#  - `match` method accepts an array object
# Output:
#  - Array of strings representing matching anagram words.

# ALGORITHM
# Initialize object that accepts a string as an arugment and store in `word` variable for later use
# Create `match` method that accepts an array of strings as an argument
#  - sort primary `word` variable alphabetically and store in local variable `sorted_word`
#  - initialize a `result` variable and initialize to an empty array to store matching words
#  - iterate through array of words and for each of them:
#    - sort word alphabetically and compare to sorted primary word
#    - if sorted primary word is equal to sorted candidate word, add candidate word to `result` array
# - After iterating through all words, return `result` array
# - ***Can also use `select` method to iterate through array and return array of matching candidates in lieu of using `result` array

class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    sorted_word = @word.downcase.chars.sort.join

    candidates.select do |candidate|
      next if candidate.downcase == @word.downcase
      candidate.downcase.chars.sort.join == sorted_word
    end
  end
end