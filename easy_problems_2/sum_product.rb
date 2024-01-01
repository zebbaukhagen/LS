def sum(int)
  sum = 0
  until int == 0
    sum += int
    int -= 1
  end
  sum
end

def product(int)
  product = 1
  until int == 0
    product *= int
    int -= 1
  end
  product
end


loop do
  puts "Please enter a number greater than 0:"
  user_int = gets.to_i
  puts "Enter 's' to compute the sum, enter 'p' to compute the product, 'q' to quit:"
  user_input = gets.chomp
  if user_input.downcase == 's'
    puts "The sum of all numbers between 1 and #{user_int} is #{sum(user_int)}."
  elsif user_input.downcase == 'p'
    puts "The product of all numbers between 1 and #{user_int} is #{product(user_int)}."
  elsif user_input.downcase == 'q'
    break
  else
    puts "Please enter a valid choice."
  end
end
