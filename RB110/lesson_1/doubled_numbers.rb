def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end
  numbers
end

array = [1, 2, 3, 4]
p array
double_numbers(array)
p array