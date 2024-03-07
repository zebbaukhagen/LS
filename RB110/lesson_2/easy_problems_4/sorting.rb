# b = ['cot', 'bed', 'mat'].sort_by do |word|
#   word[2]
# end

# puts b

                                              #1  #2
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
          #3     #4
  element1.each do |element2|
              #5        #6
    element2.partition do |element3|
              #7    #8
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]


[[[1, 2], [3, 4]], [5, 6]].map do |arr| # will return new array of arrays [[[2, 3], [4, 5], [6, 7]]
  # arr = [[1, 2], [3, 4]], [5, 6]]
  arr.map do |el|   # will return either an array of arrays, or an array
    # el = [1, 2], [3, 4], 5, 6 in turn
    if el.to_s.to_i == el   # it's an integer
      el + 1        # will return el incremented by 1
    else                    # it's an array
      el.map do |n| # will return new array with elements incremented, [2, 3] and [4, 5] respectively 
        n + 1
      end
    end
  end
end