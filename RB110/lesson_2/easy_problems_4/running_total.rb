=begin
PROBLEM:
Write a method which takes an array of numbers, and returns
a new array with the same number of elements where the elements
has the running total from the original array.

A running total is when each number is the sum of the previous number
and the current number.

[1, 2, 3] => [1, 3, 6]

EXAMPLES:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

DATA/OBSERVATIONS:
Array

We are transforming elements so we want to use map
Will need to keep a variable called last_num outside of the block
to be able to keep track of what the previous number was.

ALGORITHM:
SET an empty array
SET the current total
ITERATE over all elements of the given array with their index
if current index is 0, push current element to new array and update total
otherwise, add the current element and the total and push the result
to the new array
Then return the new array
=end

def running_total(arr)
  sum = 0
  arr.map { |value| sum += value}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []