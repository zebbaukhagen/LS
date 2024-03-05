# Determine the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

# munsters.each_key do |member|
#   if munsters[member]["gender"] == "male"
#     total_age += munsters[member]["age"]
#   end
# end

munsters.each_with_object([]) do | (k, v), a |
  a << munsters[k]["age"] if munsters[k]["gender"] == "male"
end
