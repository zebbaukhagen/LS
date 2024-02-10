words = {
  noun:       '',
  verb:       '',
  adjective:  '',
  adverb:     ''
}

words.each_key do |key|
  puts "Enter a #{key}: "
  words[key] = gets.chomp.downcase
end

story = <<HEREDOC
Do you like to #{words[:verb]} your #{words[:adjective]} #{words[:noun]} #{words[:adverb]}?
That's hilarious!
HEREDOC

puts story
