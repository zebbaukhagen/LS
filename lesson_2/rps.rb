VALID_CHOICES = %w((r)ock (p)aper (sc)issors (l)izard (sp)ock)

WINS_AGAINST = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

ABBREVIATIONS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  WINS_AGAINST[player1].include?(player2)
end

def display_results(winner)
  if winner == 'player'
    prompt("You won!")
  elsif winner == 'computer'
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def determine_results(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'neither'
  end
end

def get_user_input
  gets.chomp.downcase
end

def get_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = get_user_input
    choice = ABBREVIATIONS[user_choice] || user_choice
    return choice if valid_choice?(choice)
    prompt("That isn't a valid choice.")
  end
end

def valid_choice?(user_choice)
  ABBREVIATIONS.include?(user_choice) || 
  VALID_CHOICES.any? { |choice| choice.delete('()') == user_choice }
end

def increment_score(winner, game_stats)
  case winner
  when 'player'
    game_stats[:player_score] += 1
  when 'computer'
    game_stats[:computer_score] += 1
  end
  game_stats[:round] += 1 
end

def play_round(game_stats)
  choice = get_choice
  computer_choice = VALID_CHOICES.sample.delete('()')

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  winner = determine_results(choice, computer_choice)
  display_results(winner)
  increment_score(winner, game_stats)
  return winner
end

def refresh_game_prompt(game_stats)
  game_prompt = <<MSG
~~~~Round #{game_stats[:round]}~~~~
Player: #{game_stats[:player_score]} 
Computer: #{game_stats[:computer_score]}
MSG
end

game_stats = {
  player_score:   0,
  computer_score: 0,
  round:          1
}

loop do # Main Loop
  until game_stats[:player_score] == 3 || game_stats[:computer_score] == 3
    game_prompt = refresh_game_prompt(game_stats)
    puts game_prompt
    winner = play_round(game_stats)
  end
  prompt("~~~~Match over!~~~~")
  prompt("#{winner.capitalize} won the match!")

  prompt "Do you want to keep playing? (y/n)"
  answer = get_user_input
  break unless answer.start_with?('y')
end
