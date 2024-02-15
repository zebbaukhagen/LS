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
  # set an array of all substrings to get_substrings(string)

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

get_substrings(string)
--------------------------------------
def get_substrings(string)

=end