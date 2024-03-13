=begin
PROBLEM:
Write a method which takes a string of words, separated by
  spaces and returns a string where the first and last letters
  of each word are swaped.
Input: String
Output: New String

EXAMPLES:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

DATA:
String
Array ( for iteration )

ALGORITHM:
Split the given string into an array of words delimited by spaces
Iterate over the array of words
- For each word, save the first character
- Set the first character to be the last character
- Set the last character to be the saved character
Join and return the transformed array of words
=end

def swap(string)
  words = string.split
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'