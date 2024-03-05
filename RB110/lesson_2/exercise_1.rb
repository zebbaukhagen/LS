# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# We want to retain the structure of this array while reordering its elements 
# by their integer representations, therefor sort_by will be helpful with a conversion
# of each element to an integer

#p arr.sort_by { |el| el.to_i }.reverse!

b = arr.sort { |a,b| b.to_i <=> a.to_i }

p b

