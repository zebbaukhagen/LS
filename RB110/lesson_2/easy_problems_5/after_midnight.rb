=begin
PROBLEM:
Write a method which takes an integer which represents the minutes since
midnight in minute based format and returns a string representing
the time of day in hour format. (hh:mm) Inputs can be positive or negative.

input: integer
output: string
rules:
  - should work for any integer input
  - will wrap if the input exceeds one day (one day is 1440 minutes)
  - can ignore complications like dst and time zones

EXAMPLES:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

DATA:
Probably integer to solve the problem
And then converting to string for output

ALGORITHM:
Capture whether or not input is negative in bool
Convert input to absolute value
If input is greater than 1440, loop and subtract 1440 from it until
  it is less than 1440
Use modulus divison by 60 to get the number and remainder, which will
   be equivalent to the hours and minutes representation
If the number was negative, subtract the number and remainder from [23, 60]
  and return the respective integers to a new array, which will
  represent the time before midnight
Otherwise, convert hours into a string with up to 1 digit of leading 0's
  and do the same with minutes
Interpolate the new strings into the final return string

CODE:
=end

# def time_of_day(minutes)
#   input_negative = minutes.negative?
#   absolute_minutes = minutes.abs

#   hours_minutes = absolute_minutes.divmod(60)
#   hours_minutes[0] = hours_minutes[0] % 24

#   if input_negative
#     negative_time = [23, 60]
#     hours_minutes.map!.with_index { |val, idx|  [23, 60][idx] - val }
#   end

#   hours_minutes.map { |el| el.to_s.rjust(2, '0') }.join(':')
# end

def time_of_day(minutes)
  hours, minutes = minutes.divmod(60)
  hours %= 24

  [hours, minutes].map { |el| el.to_s.rjust(2, '0') }.join(':')
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# def time_of_day(minutes)
#   input_negative = minutes.negative?
#   hours_minutes = minutes.abs.divmod(60)

#   hours_minutes[0] %= 24

#   if input_negative
#     hours_minutes.map!.with_index { |val, idx|  [23, 60][idx] - val }
#   end

#   hours_minutes.map { |el| el.to_s.rjust(2, '0') }.join(':')
# end

# --------
=begin
PART 2

PROBLEM:
Write two methods, after_midnight and before_midnight
Which take the time of day as a string in 24 hour format
And return the number of minutes after or before midnight
respectively.

Each should return a value in the range 0..1439
=end

def after_midnight(string)
  hours, minutes = string.split(':').map { |el| el.to_i }
  (hours * 60 + minutes) % 1440
end

def before_midnight(string)
  hours, minutes = string.split(':').map { |el| el.to_i }
  ((hours * 60) + minutes) % 1440
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0