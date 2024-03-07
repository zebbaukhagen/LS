# Given this data structure, return a new array of the same structure
# but with the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

# We want to retain the data structure, so .map may be useful.
# We can map over the original array, and then sort those individual arrays

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |el|
  el.sort { |a, b| b <=> a }
end

p sorted_arr