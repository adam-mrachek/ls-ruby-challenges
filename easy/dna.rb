# PROBLEM
# Write a program that can calculate the Hamming distance between two DNA strands.
# The Hamming distance is the number of point mutations between two DNA strands. For example:

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these to DNA strands is 7.
# The Hamming distance is only defined for sequences of equal length
# If the two sequences are of unequal length, compute the distance using the shorter length strand.

# EXAMPLES / TEST CASES
# See `dna_test.rb`
# According to tests, program must have:
# - Class name of `DNA` with initialize method that accepts a string argument reprsenting a DNA strand
# - `hamming_distance` method that accepts a string argument of a second DNA strand to compare to original DNA
# - When comparing unequal length strands, methods should not actually shorten longest strand (ie. should not mutate)

# DATA STRUCTURES
# Input: `initialize` and `hamming_distance` both accept string arguments
# Output: `hamming_distance` returns integer representing number of point mutations
# May use Array to iterate through and compare each "nucleotide" in strands

# ALGORITHM
# Initialize new `DNA` object setting `strand` argument to instance variable `@strand`
# `hamming_distance` method accepts string argument representing second strand
#  - if two strands are unequal length, then shorten longer strand to equal length of shorter strand and store in local variable
#  - initialize local variable `mutations` to 0 for use in tracking mutations
#  - iterate through both strands, one index at a time and comparethe value of each index:
#  - If value at each index is the same, do nothing
#  - If the value at each index is different, add 1 to `mutations`
#  - return `mutations` when done iterating

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(second_strand)
    length = nil
    mutations = 0

    if @strand.length <= second_strand.length
      length = @strand.length
    else
      length = second_strand.length
    end

    0.upto(length - 1) do |n|
      if @strand[n] != second_strand[n]
        mutations += 1
      end
    end
    mutations
  end
end