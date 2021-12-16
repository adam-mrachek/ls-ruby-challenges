# PROBLEM
# Write a program that, given a word, computes the Scrabble score for that word
# Word score is based on the sum of values associated with each letter.

# EXAMPLES / TEST CASES
# See test suite in `scrabble_test.rb` for exact requirements.
# Program should initialize a new `Scrabble` object that accepts a string as argument upon initialization.
# Program should have `score` method that calculates score of word given at object initialization
# Program should also have a class method `Score` that allows for convenient scoring without the need to create new `Scrabble object`
# Word scores should be case insensitive
# Words with spaces do not count

# DATA STRUCTURES
# Input: string
# Ouput: integer
# May need hash to hold letter-to-value conversion
# May need array to represent each letter in word for iteration

# ALGORITHM
# Create LETTER_VALUES hash with letters as keys and letter values as values for letter score calculation
# Initialize new `Scrabble` object that accepts string argument representing word to be scored
#  - store word argument in variable to be used later
# Create `score` instance method to score `word` instance variable
#  - If word is empty or contains whitespaces, return 0 for word score
#  - create `score` variable set to integer 0
#  - iterate through each character of the word and search LETTER_VALUES for corresponding value
#  - Add corresponding value to `score`
#  - return `score`
# Create `score` class method that allows easy scoring of word without needing to create `Scrabble` object
#  - possibly leverage logic from instance method `score`

class Scrabble
  LETTER_VALUES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g)                 => 2,
    %w(b c m p)             => 3,
    %w(f h v w y)           => 4,
    %w(k)                   => 5,
    %w(j x)                 => 8,
    %w(q z)                 => 10
  }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    self.new(word).score
  end

  def valid_word?(word = @word)
    !word.nil? && !word.include?(' ') && !word.empty?
  end

  def score
    total = 0
    return total unless valid_word?

    @word.downcase.each_char do |char|
      total += LETTER_VALUES.select { |letters, value| letters.include?(char) }.values.first
    end
    total
  end
end