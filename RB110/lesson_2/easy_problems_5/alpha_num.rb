=begin
PROBLEM:
  Given an array of numbers 0-19, write a method which
  returns an array of those numbers, sorted by their 
  alphabetical order in english.

input: array of integers
output: sorted array of integers

EXAMPLE:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

DATA / notes:
hash

The simplest approach might be to make a hash of English words, mapped
to the numbers that we expect, and then using sort_by, sort the array
of integers, based on the comparison of the hash values.

ALGORITHM:
- Make hash of integers to words
- Sort the given array based on the value of the hash key which
- corresponds to the given number
- Return the sorted array

CODE:
=end

NUM_WORDS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'ninetine'
}

def alphabetic_number_sort(num_arr)
  num_arr.sort_by { |element| NUM_WORDS[element] }
end

def alphabetic_number_sort(num_arr)
  num_arr.sort { |a, b| NUM_WORDS[a] <=> NUM_WORDS[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]