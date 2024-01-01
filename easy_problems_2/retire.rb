puts "How old are you?"
user_age = gets.chomp.to_i

puts "At what age would you like to retire?"
desired_retirement_age = gets.chomp.to_i

years_until_retire = desired_retirement_age - user_age
time = Time.new
year = time.year

puts "It's #{year}, only #{years_until_retire} years of work left!"
