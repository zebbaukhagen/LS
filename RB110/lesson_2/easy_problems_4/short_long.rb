=begin
Write a method that takes two strings as arguments,
determines the longest of the two strings, and then
returns the result of concatenating the shorter string,
the longer string, and the shorter string once again.
You may assume that the strings are of different lengths.

PROBLEM:
Define a method which takes two strings
Figures out which is shorter
Then concatenates then two strings together
In the pattern of short-long-short
And returns the new concatenated string

EXAMPLES:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

DATA:
String

ALGORITHM:

def short_long_short(string_one, string_two)
 SET array to contain each String
 Sort the array in place by element size
 make new string using the strings by index and implicitly return
end
=end

def short_long_short(string_one, string_two)
  str_arr = [string_one, string_two].sort_by { |el| el.size }
  str_arr[0] + str_arr[1] + str_arr[0]
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"