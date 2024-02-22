# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the
# Munster family has an additional "age_group" key
# that has one of three values describing the age group
# the family member is in (kid, adult, or senior).
# Your solution should produce the hash below:

result = {
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
}

# the ranges are
kid = (0..17)
adult = (18..64)
senior = (65..)

def add_age_range(hash)
  kid = (0..17)
  adult = (18..64)
  senior = (65..)

  hash_copy = hash.dup
  hash.each do |key, value|
    age = value['age']
    age_group = if kid.include? age
                  'kid'
hjklkjkk    elsif adult.include? age
                  'adult'
                else
                  'senior'
                end
    hash_copy[key]['age_group'] = age_group
  end

  hash_copy
end

p add_age_range(munsters) == result
