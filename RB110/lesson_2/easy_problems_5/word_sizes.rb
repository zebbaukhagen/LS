=begin
PROBLEM:
Given a string of words delimited by spaces, return a hash which shows
the number of words of different sizes. The key is the size and the
value is the number of occurrences

input: string
output: hash

EXAMPLES:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

DATA / Notes:
Hash

We're going to be itterating and modifying a hash object

ALGORITHM:
Split given string into an array of words delimited by spaces
initialize an empty hash for result
iterate over the array of words
  - Get a words size
  - set the hash key (word size) equal to either the key-value plus 1 or
     0 + 1 if it doesn't exist yet
  return the hash

CODE:
=end

def word_sizes(string)
  result = {}
  string.split(' ').each do |word| 
    word = word.delete('^a-zA-Z')
    result[word.size] = (result[word.size] || 0) + 1
  end
  result
end

# def word_sizes(string)
#   string.split.each_with_object({}) { |w, h| h[w.size] = (h[w.size] || 0) + 1 }
# end

p word_sizes('cat cat cat frog') == {4 => 1, 3 => 3}

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}