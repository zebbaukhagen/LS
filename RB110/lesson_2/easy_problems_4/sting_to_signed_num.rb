DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_int(string)
  num_negative = string[0] == '-' ? true : false
  digits = string.chars.map { |char| DIGITS[char] }.reject { |el| el == nil }
  value = 0
  digits.each do |digit|
    value = 10 * value + digit 
  end
  num_negative ? -value : value
end

num_string = '-1023'
num = string_to_int(num_string)

p num