# given the following string
munsters_description = "The Munsters are creepy in a good way."
# convert the string to output in the following ways
test1 = "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
test2 = "The munsters are creepy in a good way."
test3 = "the munsters are creepy in a good way."
test4 = "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

ans1 = munsters_description.swapcase
ans2 = munsters_description.capitalize
ans3 = munsters_description.downcase
ans4 = munsters_description.upcase

puts test1 == ans1
puts test2 == ans2
puts test3 == ans3
puts test4 == ans4
