=begin
PROBLEM:
Add up all of the ages from the Munster family hash:
ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 5843, 
  "Eddie" => 10, 
  "Marilyn" => 22, 
  "Spot" => 237 
}

input: hash
output: integer
rules: given hash with numbers as values, return the sum of values

questions:
- Should an empty hash return nil or 0?

EXAMPLES:

p val_sum(ages) == 6174
p val_sum({'fred' => 17, 'george' => 17 }) == 34

DATA STRUCTURE:

integer - not technically a structure but a primitive type

ALGORITHM:

create an array of the values from the hash
sum and return the values

CODE:
=end

ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 5843, 
  "Eddie" => 10, 
  "Marilyn" => 22, 
  "Spot" => 237 
}

def val_sum(hash)
  hash.values.sum
end

p val_sum(ages) == 6174
p val_sum({'fred' => 17, 'george' => 17 }) == 34