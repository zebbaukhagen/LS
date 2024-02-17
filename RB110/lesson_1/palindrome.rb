# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
input: string
output: array
rules: palindromes are case-sensitive ('ABa' != 'aba')

algorithm:

str = string_to_check


get_palindrome_substrings method
--------------------------------------
def get_palindrome_substrings(string)
  set an array of all substrings to get_substrings(string)

  initialize empty array for results

  initialize counter to 0
  loop over array of substrings
  break if counter >= substring array size
    if substring is_palindrome?(string)
      put it into the results array
    end
  increment counter by 1
  end
end
=end


=begin
get_substrings(string)
--------------------------------------
def get_substrings(string)
  initialize empty array for the substrings to go into
  initialize first counter to 0
  
  loop over str starting at index 0
    break if first counter >= length of str - 2
    initialize second counter to first counter + 1
  
      start inner loop over str from second counter
      break if second counter >= length of str - 1
      substring = string slice from first counter to second counter
      put substring into array
    end
  end
end

is_palindrome?(str) method
--------------------------------------
def is_palindrome?(str)
  str == str.reverse
end
=end

def get_palindrome_substrings(string)
  substrings = get_substrings(string)
  palindromic_substrings = []
  counter = 0
  loop do
    break if counter >= substrings.size
    if is_palindrome? substrings[counter]
      palindromic_substrings << substrings[counter]
    end
    counter += 1
  end
  return palindromic_substrings
end

def get_substrings(string)
  substrings = []
  start_counter = 0
  return substrings if (string.length < 2 || string == nil)
  loop do
    end_counter = start_counter + 1
    char_length = 2
    loop do
      substring = string[start_counter, char_length]
      substrings << substring
      break if char_length >= string.length - start_counter
      char_length += 1
    end
    break if start_counter >= string.length - 2
    start_counter += 1
  end
  return substrings
end

def is_palindrome?(string)
  string == string.reverse
end


puts get_palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts get_palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts get_palindrome_substrings("palindrome") == []
puts get_palindrome_substrings("")  == []