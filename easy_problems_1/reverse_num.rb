def reversed_number(num)
  num.to_s.reverse.to_i
end

def reverse_number_mathematically(num)
  reversed_number = 0
  while num > 0
    digit = num % 10
    reversed_number = reversed_number * 10 + digit
    num /= 10
  end
  reversed_number
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

puts reverse_number_mathematically(12345) == 54321
puts reverse_number_mathematically(12213) == 31221
puts reverse_number_mathematically(456) == 654
puts reverse_number_mathematically(12000) == 21 # No leading zeros in return value!
puts reverse_number_mathematically(12003) == 30021
puts reverse_number_mathematically(1) == 1
