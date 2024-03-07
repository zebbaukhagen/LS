# Use any methods to select or reject integers from the following nested array
# so that the result only contains integers which are multiples of 3

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# The returned array should have the following value:

result = [[], [3, 12], [9], [15]]

my_arr = arr.map do | inner_arr |
  inner_arr.select { |num| num % 3 == 0 }
end

p my_arr == result