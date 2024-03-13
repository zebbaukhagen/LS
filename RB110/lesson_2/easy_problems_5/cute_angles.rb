=begin
PROBLEM:
Write a method which takes a float between 0 and 360 and returns
a string representation of the angle it corresponds to in degrees,
minutes and seconds.



=end
DEGREE = "\xC2\xB0"

def dms(decimal)
  degrees, fraction = decimal.divmod(1)
  minutes, fraction = (fraction * 60).divmod(1)
  seconds = (fraction * 60).round

  if seconds == 60
    seconds = 0
    minutes += 1
  end

  if minutes == 60
    minutes == 0
    degrees += 1
  end

  
  format("%d%c%02d\'%02d\"", degrees, DEGREE, minutes, seconds)
end

# All test cases should return true
puts dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")