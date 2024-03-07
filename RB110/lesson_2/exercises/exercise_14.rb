# Create a method which returns a UUID when called with no parameters.
# A UUID is a string of 32 hexadecimal characters broken into 5 sections
# the sections are delimited by hyphens and follow the pattern of length like:
# 8-4-4-4-12

# An example would be 
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

=begin
PROBLEM:
Write a method which returns a UUID when called, and takes no parameters

input: none
output: 36 character string
rules:
  - A UUID is a random string of hexadecimal characters
  - The string is broken into 5 sections consisting of character lengths, 8-4-4-4-12
  - The sections are delimited with hyphens
  - The alphabetical characters can all be lowercase

EXAMPLES:
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
"asd983hd-6ds6-sfs9fm3hj-adkin3189hda"

DATA / SCRATCH:
string

Keep an array of possible hexadecimal characters to sample?

ALGORITHM:

initialize an empty array of arrays with the correct number of elements already in them
  - Loop over the inner arrays
    - Loop over individual elements and replace them with random characters sampled from char array
  
  join the inner arrays into a string
join the outer array into a string delimited with hyphens and return it

=end

def get_UUID
  valid_characters = (0..9).to_a + ('a'..'f').to_a
  empty_ID = [
    [nil, nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil],
    [nil, nil, nil, nil],
    [nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  ]
  id_arr = empty_ID.map do |array|
    array.map { |value| value = valid_characters.sample }.join
  end
  id_arr.join('-')
end

puts get_UUID
