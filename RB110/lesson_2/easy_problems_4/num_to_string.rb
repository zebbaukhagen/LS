# write a function which will take an integer input and output a
# string representation of it without using conventional built-in methods

=begin
PROBLEM:
input: integer
output: integer
rules:
- Can assume valid number input
- Can assume positive integer

EXAMPLES:
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

DATA:
string

ALGORITHM:
Extract all digits of integer into an ordered array
Iterate through the new array and using a dictionary constant, look up the corresponding string value
Push this string value into a new array which we will join and return

CODE:
=end

def integer_to_string(int)
  digits = []
  return '0' if int == 0
  until int == 0
  int, last_digit = int.divmod(10)
    digits.prepend(last_digit)
  end
  digits.join
end

def signed_integer_to_string(number)
  num_string = integer_to_string(number.abs)
  case number <=> 0
  when -1 then "-#{num_string}"
  when +1 then "+#{num_string}"
  else             num_string
  end
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'