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

def determine_results(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'neither'
  end
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

def get_user_input
  gets.chomp.downcase
end

def valid_choice?(user_choice)
  ABBREVIATIONS.include?(user_choice) || 
  VALID_CHOICES.any? { |choice| choice.delete('()') == user_choice }
end

def get_choice
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = get_user_input
    choice = ABBREVIATIONS[user_choice] || user_choice
    return choice if valid_choice?(choice)
    prompt("That isn't a valid choice.")
  end
end

loop do
  player_wins = 0
  computer_wins = 0
  round = 1

  until player_wins == 3 || computer_wins == 3
    puts "~Round #{round}~ Player: #{player_wins} | Computer: #{computer_wins}"
    choice = get_choice

    computer_choice = VALID_CHOICES.sample.delete('()')

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    winner = determine_results(choice, computer_choice)
    display_results(winner)
    (player_wins += 1) if winner == 'player'
    (computer_wins += 1) if winner == 'computer'

    round += 1
  end
  prompt("~Match over!~")
  prompt("#{winner.capitalize} won the match!")

  prompt "Do you want to keep playing? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
