hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# Write some code to return an array that contains the colors of the fruits
# and the sizes of the vegetables. For example:

answer = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_h = hsh.map do | _, v |
  if v[:type] == 'fruit'
    v[:colors].map { |v| v.capitalize }
  elsif v[:type] == 'vegetable'
    v[:size].upcase
  end
end

p new_h == answer