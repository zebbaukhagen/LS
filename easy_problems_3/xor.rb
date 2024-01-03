# Write a method that takes two arguments.
# It returns true if exactly one of its arguments is truthy, and false otherwise

def xor?(arg1, arg2)
  !!((arg1 && !arg2) || (arg2 && !arg1))
end

puts xor?(true, false)   == true
puts xor?(false, false)  == false
puts xor?(false, true)   == true
puts xor?(true, true)    == false

puts xor?(5.even?, 4.even?)# == true
puts xor?(5.odd?, 4.odd?)# == true
puts xor?(5.odd?, 4.even?)# == false
p xor?(5.even?, 4.odd?).class# == false
