=begin
PROBLEM:
Write a method which, when given an integer, returns the index
of the fibbonaci number which has that number of digits.

input: integer
output: integer

rules:
- index starts with 1

EXAMPLES:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847 

DATA:
integers
possibly string to find number of digits

ALGORITHM:
need to split the problem into two parts
1. method to calculate the next fibbonaci number
2. testing the number of digits of the current number

initialize a counter which tracks the digit of the fib_index
initialize an integer to track the 1st fib num
initialize an integer to track the 2nd fib num
start a loop
- call fib_num method, pass in 1st fib num and 2nd fib num
- set 1st fib num to 2nd fib num
- set 2nd fib num to return value of fib_num method
- break loop if size of fib num 2 is greater than or equal to n
- increment counter
end

CODE:
=end

def find_fibonacci_index_by_length(length)
  counter = 7
  num1 = 8
  num2 = 13

  until num2.to_s.size >= length    
    next_num = num1 + num2
    num1 = num2
    num2 = next_num
    counter += 1
  end
  
  counter
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847