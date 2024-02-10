def negative(int)
  int > 0 ? int * -1 : int
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby