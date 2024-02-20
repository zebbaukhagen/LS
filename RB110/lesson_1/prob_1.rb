=begin
PROBLEM:
Given an array of names, return a hash where the names
Are keys and the values are the positions in the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

rules: array will contain strings, strings become keys and 
        the index of the strings will become the values
input: array
output: hash

EXAMPLES:
flint_hash['Fred'] == 0
flint_hash['Wilma'] == 2
flint_hash['BamBam'] == 5

DATA TYPE:
hash

ALGORITHM:

def hashify(array)
  create an empty hash
  iterate over the given array accessing each value with index
    set each string to hash key paired with index as value
  return new hash
end

CODE
=end
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def hashify(array)
  result = {}
  array.each_index do |index|
    result[array[index]] = index
  end
  result
end

def hashify(arr)
  hash = {}
  counter = 0
  until counter >= arr.size
    hash[arr[counter]] = counter
    counter += 1
  end
  hash
end

def hashify(arr)
  arr.to_h { |item| [item, arr.index(item) ] }
end


flint_hash = hashify flintstones
# p flint_hash
p flint_hash['Fred'] == 0
p flint_hash['Wilma'] == 2
p flint_hash['BamBam'] == 5