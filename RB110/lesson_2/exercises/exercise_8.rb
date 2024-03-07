# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}

vowels = %q(aeiou)

hsh.each do | _, value |
  value.join.chars.each { |letter| puts letter if vowels.include? letter }
end
