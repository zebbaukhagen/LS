def greeting(name)
  if name[-1] == '!'
    name.slice!("!")
    puts "HELLO #{name.upcase}, WHY ARE WE SCREAMING?"
  else
    puts "Hello, #{name}. How are you today?"
  end
end

puts "What is your name?"
user_name = gets.chomp
greeting user_name
