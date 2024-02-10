def center_of(string)
  char_array = string.chars
  until char_array.size <= 2
    char_array.pop
    char_array.shift
  end
  char_array.join
end


puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
