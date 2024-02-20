# Create a hash that expresses the frequency with which
# each letter occurs in this string:
statement = "The Flintstones Rock"

def count_letters(string)
  hash_result = {}
  char_arr = string.chars
  char_arr.each do |char|
    hash_result[char] = hash_result[char] == nil ? 
                        1 : hash_result[char] + 1
  end
  hash_result
end

char_count = count_letters(statement)
p char_count