=begin

PROBLEM:
Make a method which takes a string of numeric characters
and returns a numerically equivalent integer

explicit rules:
- must avoid built in methods
- can ignore leading '+' or '-' signs
- can assume that strings will contain only numeric numbers

implicit rules:
- leading and 0's cannot be preserved

input: string
output: integer

EXAMPLES:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

DATA/OBSERVATIONS:
Integer for return value, should be able to perform this
calculation without an array, but might use one for iteration.
Might need a hash to map strings to numbers.

ALGORITHM:
Build a hash which maps strings to integers

hash_builder():
 - SET integers = range object of integers 0-9 converted to array
 - SET alpha_nums = range object of strings '0'-'9' converted to array
 - SET empty hash = {}
 - SET counter = 0
 LOOP 
  - set the key of the new hash and its value to the respective counter
    indexes of the arrays
  - increment counter
end loop
return new hash

string_to_integer method (string)
- SET alphanum_hash to return from hash builder
- SET char_arr to result of breaking string into chars
- SET int_array = []
- ITERATE over char_arr
    - PUSH corresponding hash map value into the int_array
- SET result = convert_arr_to_integer(int_array)
end

CODE:
=end
def hash_builder
  alpha_nums = ('0'..'9').to_a
  integers = (0..9).to_a
  hash = {}
  alpha_nums.each_with_index { |v, i| hash[v] = integers[i] }
  return hash
end

def convert_arr_to_integer(int_array)
  int = 0
  counter = -1
  until counter < -(int_array.size) do
    if counter == -1
      int += int_array[counter].ceil(counter + 1)
    else
      int += int_array[counter].ceil(counter + 1) * int_array[counter]
    end
    counter -= 1
  end
  int
end

def string_to_integer(string)
  alpha_nums = hash_builder
  char_arr = string.chars
  int_array = char_arr.map { |char| alpha_nums[char] }
  convert_arr_to_integer(int_array)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570