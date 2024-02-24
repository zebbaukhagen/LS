=begin
PROBLEM:
Write a method that searches for all multiples of 3 or 5 that 
lie between 1 and some other number, and then computes the sum 
of those multiples. For instance, if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

EXAMPLES:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

DATA:
integer

ALGORITHM:
SET range = 1..user_num
SET multiples_array = []
LOOP over range
  if num % 3 == 0 or num % 5 == 0
    add num to multiples_array
SET sum = multiples_array.sum
return sum
=end

def multisum(int)
  multiples = (1..int).select { |n| n % 3 == 0 || n % 5 == 0 }
  multiples.sum
end

def multisum(int)
  (1..int).select {|n| n % 3 == 0 || n % 5 == 0}.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168