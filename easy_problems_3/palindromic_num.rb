def reverse_integer(integer)
  reversed_num = 0
  while integer > 0
    digit = integer % 10
    reversed_num = (reversed_num * 10) + digit
    integer /= 10
  end
  reversed_num
end

def palindromic_number?(integer)
  integer == reverse_integer(integer)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true