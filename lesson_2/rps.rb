require 'pry'

VALID_CHOICES = %w((r)ock (p)aper (sc)issors (l)izard (sp)ock)

CHOICES = {
  'rock' => { abbreviation: 'r', beats: ['scissors', 'lizard'] },
  'paper' => { abbreviation: 'p', beats: ['rock', 'spock'] },
  'scissors' => { abbreviation: 'sc', beats: ['paper', 'lizard'] },
  'lizard' => { abbreviation: 'l', beats: ['paper', 'spock'] },
  'spock' => { abbreviation: 'sp', beats: ['rock', 'scissors'] }
}

def print_in_box(string)
  row = (' ' * (string.size + 2)).center(string.size + 4, '|')
  cap = ('-' * (string.size + 2)).center(string.size + 4, '+')

  puts cap
  puts row
  puts '|' + "#{string}".center(string.size + 2) + '|'
  puts row
  puts cap
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear')
end

def win?(player1, player2)
  CHOICES[player1][:beats].include?(player2)
end

def find_key_by_abbreviation(abbreviation)
  key = CHOICES.find { |_key, value| value[:abbreviation] == abbreviation }
  return key.first if key
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
    choice = find_key_by_abbreviation(user_choice)
    choice = user_choice if choice.nil? && CHOICES.key?(user_choice)
    return choice unless choice.nil?
    prompt("That isn't a valid choice.")
  end
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
  computer_choice = CHOICES.keys.sample
  clear_screen

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  winner = determine_results(choice, computer_choice)
  display_results(winner)
  increment_score(winner, game_stats)
  winner
end

def refresh_game_prompt(game_stats)
  <<~MSG
  ~~~~Round #{game_stats[:round]}~~~~
  Player: #{game_stats[:player_score]}
  Computer: #{game_stats[:computer_score]}
  MSG
end

def display_match_end(winner, game_stats)
  print_in_box("~~~~Match over!~~~~")
  prompt("#{winner.capitalize} won the match!")
  prompt("Player: #{game_stats[:player_score]} | Computer: #{game_stats[:computer_score]}")
end

def reset_game_stats
  game_stats = {
  player_score: 0,
  computer_score: 0,
  round: 1
  }
end

game_stats = reset_game_stats

# clear screen before play starts
clear_screen

loop do # Main Loop
  until game_stats[:player_score] == 3 || game_stats[:computer_score] == 3
    puts(refresh_game_prompt(game_stats))
    winner = play_round(game_stats)
  end
  display_match_end(winner, game_stats)
  prompt "Do you want to keep playing? (y/any)"
  answer = get_user_input
  if answer.start_with?('y')
    game_stats = reset_game_stats
    clear_screen
    next
  end
  prompt('Thanks for playing!')
  break
end
