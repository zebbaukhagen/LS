=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century
number, and ends with st, nd, rd, or th as appropriate for that
number.

New centuries begin in years that end with 01. 
So, the years 1901-2000 comprise the 20th century.

PROBLEM:
Write a method which takes an integer as input and returns
a string representing to which century the integer belongs
as a year. 

input: integer
output: string
questions:
How should I handle negative numbers?

explicit rules:
The return string must be appended with the correct suffix for
which number with which it ends. I.E, 2'nd' 3'rd' 4'th' and so on.
New centuries begin in years that end with 01, so 1901-2000.

implicit rules:
The input integer has no limit in either direction.

EXAMPLES:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

DATA:
String

OBSERVATIONS:
It might be helpful to drive this off of rounding to the nearest
upward hundreth and then read the first two numbers:
2056 rounds to 2100, the first two numbers are 21, etc
For higher numbers, we just want to round to the nearest
hundreth and then discard the ones and tens digits.
Modulo division might help with this. 

The word suffix could be stored as a hash, 3 => 'rd' etc.
Could get the final digit by mod diving by 10

ALGORITHM:
SET century_num = year ceiling rounded to 2 digits / 100
suffix = case century_num % 10
when 1 => st
when 2 => nd
when 3 => rd
default => th

concatenate string to return
=end

def century(year)
  century = (year.ceil(-2) / 100)
  suffix =  case century % 10
            when 1 then century % 100 == 11 ? 'th' : 'st'
            when 2 then century % 100 == 12 ? 'th' : 'nd'
            when 3 then century % 100 == 13 ? 'th' : 'rd'
            else 'th'
            end
  "#{century}#{suffix}"
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'