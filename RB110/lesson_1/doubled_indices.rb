=begin
input: array of integers
output: a new array of integers
rules: return a new array of integers that comprises of numbers from the original array which
        were doubled if those numbers were found at odd indices.

step 1: make an empty array
step 2: make a counter
step 3: iterate over the original array based on counter
step 4: if the counter is odd, double the number found at that index
step 5: add the doubled number to the empty array
step 6: break if the counter reaches the size of the original array minus 1
step 7: return the new array
=end


def double_if_odd(array, coefficient)
  result = []
  counter = 0

  loop do
    if counter.odd?
      result << array[counter] * coefficient
    end
    break if counter == array.size - 1
    counter += 1
  end
  
  result
end

p double_if_odd([1, 2, 3, 4, 5], 2) == [4, 8]
p double_if_odd([5], 100) == []
p double_if_odd([10, 10, 10, 10, 10, 10], 4) == [40, 40, 40]
