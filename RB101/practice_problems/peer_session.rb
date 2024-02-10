# 1) What will be output and why?
x = 10
3.times do |x|
  x = x + 1
end
puts x

# 2) What will be output and why?
def greet(name = "Bob")
  "Hello, #{name}!"
end

puts greet("Steve")
puts greet()

# 3) What are the outputs and why?
def add_five(num)
  sum = num + 5
end

sum = 3
result = add_five(sum)
puts sum
puts result

# 4) What are the outputs and why?
def append_exclamation(word)
  word << "!"
end

greeting = "Hello"
shouted_greeting = append_exclamation(greeting)
puts greeting
puts shouted_greeting

# 5) What is the scope of 'x' and what are it's values at various points
def change_values
  x = 4
  yield(x)
  puts "After block, x is #{x}"
end

x = 2
change_values { |x| x = x * x }
puts "Outside method, x is #{x}"

# 6) Why is the array mutated by the method but the number is not?
def modify(array, num)
  array.pop
  num += 10
end

my_array = [1, 2, 3]
my_num = 10
modify(my_array, my_num)
puts "Array: #{my_array}"
puts "Number: #{my_num}"

# 7) Does this code have a bug?
2.times do |i|
  sum = 10
  3.times do |j|
    sum = i + j
  end
  puts sum
end

