# def triangle(num)
#   num.times { |index| puts ('*' * (index + 1)).rjust(num) }
# end

def triangle(num, v_flip=false, h_flip=false)
  if h_flip && v_flip
    if v_flip
      num.times { |index| puts (' ' * (index)).rjust(num, '*') }
    else
      num.times { |index| puts ('*' * (index + 1)).ljust(num) }
    end
  else
    if v_flip
      num.times { |index| puts (' ' * (index)).ljust(num, '*') }
    else
      num.times { |index| puts ('*' * (index + 1)).rjust(num) }
    end
  end
end

triangle(10)                 # bottom right
triangle(10, false, true)    # bottom left
triangle(10, true, false)    # top right 
triangle(10, true, true)     # top left

=begin

First, I should figure out how to print a string of splats that
increases to the size of num inside of a loop

And then, I can right justify to the limit of number with spaces

START
SET max = num
SET counter = 0

until counter == max
  if h_flip == true
    print ('*' * (counter + 1).ljust(max))
  counter += 1

END

=end
