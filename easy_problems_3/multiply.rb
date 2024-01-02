def multiply(num1, num2)
  num1 * num2
end

def exponentiate(num, power)
  counter = 0
  result = num
  while counter < power - 1
    result = multiply(result, num)
    counter += 1
  end
  result
end


# p multiply([1, 2, 3], 6)
# puts multiply(5, 3) == 15

puts exponentiate(2, 10) == 1024
