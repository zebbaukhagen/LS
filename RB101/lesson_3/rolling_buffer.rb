def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

a = %w(a b c d)
b = %w(z y x w)

puts "object A's ID: #{a.object_id}"
puts "object B's ID: #{b.object_id}"

a = rolling_buffer1(a, 4, 'e')
p a
puts "object A's ID: #{a.object_id}"

rolling_buffer2(b, 4, 'v')
p b
puts "object B's ID: #{b.object_id}"
