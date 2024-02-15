str = 'How do you get to Carnegie Hall?'

p arr = str.split     # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
puts arr.join         # => "HowdoyougettoCarnegieHall?"
puts arr.join ' '     # => "How do you get to Carnegie Hall?"
str = ''
arr.each { |word| str += word + ' ' }
p str.chomp(' ')
p arr.sum('') { |element| element.to_s + ' ' }.chomp(' ')