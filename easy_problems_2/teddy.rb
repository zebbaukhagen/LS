def random_age
  (20..200).to_a.sample
end

def display_person(name = 'Teddy', age)
  puts "#{name} is #{age} years old!"
end

puts "What's a name?"
user_input = gets.chomp
user_input == '' ? name = nil : name = user_input
display_person(name, random_age)
