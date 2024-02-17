produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  keys = hash.keys
  counter = 0
  fruit = {}

  while counter < keys.length
    current_key = keys[counter]
    if hash[current_key] == 'Fruit'
      fruit[current_key] = hash[current_key]
    end
    counter += 1
  end
  fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}