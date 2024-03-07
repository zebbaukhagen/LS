# Transform the following array using map

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# into this output with each integer incremented by 1

# [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
new_arr = []
arr.map do |element|
  new_hsh = {}
  element.each { |k, v| new_hsh[k] = v + 1 }
  new_arr << new_hsh
end

p arr
p new_arr