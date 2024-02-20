# What is output by this code?

numbers = [1, 2, 3, 4]
mod_num = numbers.each do |number|
  p number
  numbers.shift(1)
end

p mod_num == [3, 4]
p numbers == mod_num

# ITERATIONS:
# 1. => 1
#   shift then removes and returns the first
# element which is 1
# numbers == [2, 3, 4]

# 2. number is now at index 1
#   => 3
# then shift removes the first element
# which is 2
# numbers == [3, 4]

# 3. number is now out of range so the each block
# stops being invoked and the each invocation returns 
# numbers, which is now [3, 4]

# console will say:
# 1
# 3
# true
# true

numbers = [1, 2, 3, 4]
mod_num = numbers.each do |number|
  p number
  numbers.pop(1)
end

p mod_num == [1, 2]
p numbers == mod_num

# ITERATIONS

# 1. number is at index 0
# => 1
# pop removes the last element and returns it: 4
# numbers == [1, 2, 3]

# 2. number is at index 1
# => 2
# pop removes the last element and returns it: 3
# numbers == [1, 2]

# 3. number is now at index 2 which is out of range
# therefor the iteration stops and each returns 
# its caller, which is now [1, 2]

# console will say:
# 1
# 2
# true
# true