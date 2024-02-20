=begin
PROBLEM:

In the ages hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
remove people with age 100 and greater.

input: hash
output: mutated hash
rules: seems to be asking for mutated hash

questions:
- Should I return the same hash but mutated?

EXAMPLE:
youngins = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
p remove_elders(ages) == youngins

DATA STRUCTURE:
hash

ALGORITHM:

iterate over hash and remove any pairs where value is greater than 100

CODE:
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
youngins = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

def remove_elders(hash)
  hash.filter! { |k, v| v <= 100 }
end

def remove_elders(hash)
  hash.reject! { |k, v| v > 100 }
end

def remove_elders(hash)
  hash.keep_if { |k, v| v <= 100 }
end

p remove_elders(ages) == youngins