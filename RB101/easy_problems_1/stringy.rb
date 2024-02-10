def stringy(pos_int, start_num=1)
  result = ''
  pos_int.times { |index| result << (index.even? ? '1' : '0') }
  start_num == 1 ? result : result.tr('10', '01')
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
