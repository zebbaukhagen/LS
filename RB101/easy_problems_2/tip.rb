puts "What is the bill amount?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip = (bill * (tip_percentage / 100)).round(2)
bill = bill + tip

puts "The tip is $#{format('%.2f', tip)}."
puts "The total with tip is $#{format('%.2f', bill)}."
