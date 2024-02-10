# Ask for length of room
# Ask for depth of room
# Calculate area of room
# Display output

def calc_room_area(length, width)
  length * width
end

def convert_meters_to_feet(square_meters)
  square_meters * 10.7639
end

puts "Enter the length of the room in meters:"
room_length = gets.to_i
puts "Enter the width of the room in meters:"
room_width = gets.to_i

room_area_meters = calc_room_area(room_length, room_width)
room_area_feet = convert_meters_to_feet(room_area_meters)

puts "The area of the room is #{room_area_meters} square meters (#{room_area_feet} square feet)"