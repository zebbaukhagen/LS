# 1. What is the return value of the `select` method below 
# and why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The invocation of select will iterate over the array of numbers
# and return a new array that comprises of the elements for which
# the block returns a truthy value. In this case, the implicit
# return value of the block is a string object, which is truthy
# and so every element will be passed into the new array.
# The output should be an identical, but different array.

# 2. How does count treat the block's return value?
# How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# `count` treats the return value of the block as truthy or not.
# It will accumulate the number of elements for which the block
# returns a truthy value. 
# In this case it is counting the length of the strings.

# We could test this by changing `str.length < 4` to
# something truthy like a string object, which should cause
# the block to return the number of elements in the caller.

# 3. What is the return value of reject in the following code?
# Why?

[1, 2, 3].reject do |num|
  puts num
end

# reject will return a new array whose elements are those from
# the calling object for which the block returns a falsy value.
# Therefor, an identical but different array will be returned.

# 4. What is the return value of each_with_object
# in the following code?
# Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The return value will be a new hash object which
# contains a single character string as a key which points
# to the string that it was yoinked from. 
# { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# this is because each_with_object takes an object as
# an argument for which it will fill with the result of the
# transformations which happen inside of the block.

# 5. What does shift do in the following code?
# How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# We can find out by reading the documentation!
# Shift willdestructively return the first hash entry 
# as a 2 element array
# which in this case will be [:a, 'ant']

# 6. What is the return value of the following statement?
# Why?

p ['ant', 'bear', 'caterpillar'].pop.size

# The return value will be 11 because we are passing the return
# value of the .pop method invocation into the .size
# method as an argument. .pop returns the last element of
# its caller, which is the string 'caterpillar'.
# if we pass this string into .size, .size will return the
# number of characters inside of the string object.

# 7. What is the block's return value in the following code?
# How is it determined?
# Also, what is the return value of any? in this code
# and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The blocks return value will be either true or false
# which is determined by the implicit return of
# the num.odd? method invocation on the final line of the block.
# Because `any?` will return true if its block evaluates to true
# even a single time, it will return true in this case.
# fun fact: any? displays short circuiting behavior and stops
# iterating once it receives a truthy return value from the block.

# 8. How does `take` work? Is it destructive?
# How can we find out?

arr = [1, 2, 3, 4, 5]
p arr.take(2)

# I have no idea, let's look at the docs.

# It looks as if `take` returns a new array whose elements
# are the first n elements of the caller where n is a 
# non-negative integer passed as an argument to `take`.
# It is not destructive, it returns a new array.

# This means that the return value from above will be
# a new array: [1, 2]

# 9. What is the return value of map in the following code?
# Why?

a = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

p a

# The non-destructive version of `map` will return
# a new array which contains the objects returned by the block

# In this case, the block will return nil on the first iteration
# and 'bear' on the second, and `map` will return [nil, 'bear']

# 10. What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The return value will be an array: [1, nil, nil]
# Because map will return an array of the objects which are
# returned by the block and inside of the block
# there is an if statement which evaluates the value of `num`
# Because the block will invoke `puts` if `num` is greater than 1
# The return value of the block is `nil` for both 2 and 3.
# However for 1, the if statement will return `num` which points
# to `num`.