def print_in_box(string)
  strings = []
  row = ''
  cap = ''

  if string.size > 76
    string.chars.each_slice(76) { |tuple| strings << tuple.join }
    row = (' ' * 78).center(80, '|')
    cap = ('-' * 78).center(80, '+')
  else
    row = (' ' * (string.size + 2)).center(string.size + 4, '|')
    cap = ('-' * (string.size + 2)).center(string.size + 4, '+')
  end

  puts cap
  puts row
  if strings.empty?
    puts "| #{string} |"
  else
    strings.size.times { |index| puts '|' + "#{strings[index]}".center(78) + '|' }
  end
  puts row
  puts cap
end

print_in_box("This is a silly sentence")
print_in_box('')
print_in_box('Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.')
