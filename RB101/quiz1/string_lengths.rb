string1 = 'To be or not to be'
string2 = 'Write a method that takes one argument'
string3 = ''

# method 1 works

# def string_lengths(sentence)
#   strings = sentence.split

#   strings.map { |chars| chars.length }
# end

# method 2 does not work

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []

#   strings.each do |string|
#     lengths << string.size # doesn't return lengths at the end of method
#   end
# end

# method 3 works

# def string_lengths(sentence)
#   words = sentence.split
#   word_lengths = []
#   counter = 0

#   while counter < words.size do
#     word_lengths << words[counter].length
#     counter += 1
#   end

#   word_lengths
# end

#moethod 4 does not work

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1

#   until counter == strings.size do
#     lengths.push(strings[counter - 1].size) if strings[counter - 1]
#     counter += 1
#   end

#   lengths
# end

p string_lengths string1
p string_lengths string2
p string_lengths string3