def count_char(string)
  string.delete(' ').size
end

puts "Enter a word or phrase:"
user_input = gets.chomp

puts "There are #{count_char(user_input)} characters in \"#{user_input}\"."
