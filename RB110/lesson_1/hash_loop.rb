show_prices = {
  Eminem: '$120',
  Beyonce: '$400',
  Usher: '$600',
  FroggyFresh: 'Priceless'
}

artists = show_prices.keys
counter = 0

loop do
  break if counter == show_prices.size
  current_artist = artists[counter]
  show_price = show_prices[current_artist]
  puts "The price for #{current_artist}'s show is #{show_price}"
  counter += 1
end