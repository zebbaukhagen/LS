alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  if counter.odd?
    alphabet[counter] = alphabet[counter].upcase
  end
  counter += 1
end

puts alphabet
