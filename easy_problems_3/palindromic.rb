def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  clean_string = string.gsub(/\W/, '').downcase
  palindrome?(clean_string)
end
 
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

puts palindrome?([1, 2, 3, 2, 1]) == true
puts palindrome?([1, 2, 3, 4, 51]) == false
puts palindrome?(['a', 'A', 'b', 'c']) == false
puts palindrome?([nil, 2, 3, 2, nil]) == true

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
