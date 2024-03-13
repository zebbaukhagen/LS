=begin
PROBLEM:
Given a string with some words and some non-alphabetic characters,
write a method that will return a string with all of the non-alphabetic
characters replaced by spaces.

RULES:
- if more than one non-alpha char occurs in a row, replace with single space
- all letters in the words will be lowercased

INPUT: string
OUTPUT: string
=end

# def cleanup(string)
#   string.gsub(/[^a-z]+/, ' ')
# end

def cleanup(string)
  string.gsub(/\W+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---what's1my +*& 333line?") #== ' what s my line '
p cleanup("---what's_my +*& ___line?") #== ' what s my line '