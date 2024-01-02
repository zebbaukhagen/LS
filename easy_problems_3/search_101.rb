def ordinalize(num)
  num = (num % 10).to_s
  case num
  when '1' then "1st"
  when '2' then "2nd"
  when '3' then "3rd"
  else num  +   'th'
  end
end

num_array = []
num_to_search = nil

loop do
  if num_array.size <= 4
    puts "=> Enter the #{ordinalize(num_array.size + 1)} number."
  else
    puts "=> Enter a number to search:"
  end
    num_to_search = gets.to_i
  break if num_array.size == 5
  num_array << num_to_search
end

if num_array.include?(num_to_search)
  puts "The number #{num_to_search} is included in #{num_array}."
else
  puts "The number #{num_to_search} is not included in #{num_array}."
end
