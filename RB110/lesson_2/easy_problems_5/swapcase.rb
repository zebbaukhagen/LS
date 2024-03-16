LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

# def swapcase(str)
#   str.chars.map do |el|
#     if LOWERCASE.include?(el)
#       UPPERCASE[LOWERCASE.index(el)]
#     elsif UPPERCASE.include?(el)
#       LOWERCASE[UPPERCASE.index(el)]
#     else
#       el
#     end
#   end.join
# end

# def swapcase(str)
#   str.gsub(/[a-zA-Z]/) { |c| c =~ /[A-Z]/ ? c.downcase : c.upcase }
# end

def swapcase(str)
  str.gsub(/([a-zA-Z])/, '\1a')
end

p swapcase('PascalCase') #== 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'