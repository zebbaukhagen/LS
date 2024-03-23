require 'yaml'

ART = YAML.load_file('ttt_art.yml')
MSGS = YAML.load_file('ttt_msgs.yml')

MENU_SCREENS = {
  'main_menu'     => {text: MSGS['main_menu'],    inputs: ['1', '2', '3', '4', '5']},
  'custom'        => {text: MSGS['custom_game'],  inputs: ['1', '2', '3', '4', '5']},
  'instructions'  => {text: MSGS['instructions'], inputs: []},
  'credit'        => {text: MSGS['credit'],       inputs: []}
}

QUIT_COMMANDS = ['q', 'quit', 'exit']

TEXT_SPEED = 0.01

=begin
Tic tac toe CLI game
--------------------

Features:
1. Dynamic menu states (can move back and forward)
2. Variable difficulties (easy, medium, hard, nightmare)
3. Variable board sizes - CHECK
4. Board refreshes instead of printing again - CHECK
5. Ability to quit at any point
6. Greeting / farewell (cancel farewell) - CHECK
7. Pause between player and computer turns to simulate computation
8. Clear instructions screen
9. Beautiful intro/win/loss screens
10. UI prompt line with info like scores/turn/etc - CHECK
11. Variable first-turn advantage (player first, computer first, computer chooses)
12. Whoever lost last round gets to go first this round
13. Maybe more than 2 players? idk
14. Variable number of rounds ?

Overview:

START
- Display fake loading screen
- Display intro screen
  - Wait for user to press a key
- Display main menu and wait for player choice
- Play (default default_settings)
- Custom Game
  - AI model (difficulty level)
  - Board size
  - Number of rounds
  - Ready to play? 
- Quit

GAME
- Display fake loading screen

- Display HUD
- Initialize board state
LOOP
- Display board state
- Turn happens (both players)
- Check for game end state
- Refresh HUD
END
- Trigger end screen
- Return to main menu


UI Design:
| Round: 1 | Score: [Player: 0] [Computer: 0] | Turn: YOURS! |
=end

RED     = '31'
GREEN   = '32'
YELLOW  = '33'
BLUE    = '34'
CYAN    = '36'

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def set_board(size = :small)
  case size
    when :small
      generate_board(3)
    when :medium
      generate_board(5)
    when :large
      generate_board(7)
    end
end

def generate_board(rows_columns)
  board = []
  row = []
  counter = 1
  until counter > rows_columns**2
    row << counter.to_s
    if counter % rows_columns == 0
      board << row
      row = []
    end
    counter += 1
  end
  board
end

def display_board(board)
  double_digit = board.last.any? { |el| el.size > 1 }
  dash_line_size = (' ' + board.last.join(' | ') + ' ').size

  board.each_with_index do |row, index|
    puts format_row(row, double_digit)
    if index < board.size - 1
      puts '-' * dash_line_size
    end
  end
end

def format_row(row, double_digit = false)
  formatted_row = row.map do |el|
    colored_el = el.match?(/[1-9]/) ? colorize(el, RED) : colorize(el, GREEN)
    double_digit && el.size < 2 ? colored_el.prepend(' ') : colored_el
  end.join(' | ')
  ' ' + formatted_row + ' '
end

def clear_screen
  system('clear')
end

def get_hud(stats)
  div                           = colorize('|',       BLUE)
  round_label,  score_label     = colorize('Round:',  BLUE), colorize('Scores:',    BLUE)
  player_label, computer_label  = colorize('Player:', CYAN), colorize('Computer:',  CYAN)
  turn_label                    = colorize('Turn:',   BLUE)

  round_num       = colorize(stats[:round],           YELLOW)
  player_score    = colorize(stats[:scores][:player], YELLOW)
  computer_score  = colorize(stats[:scores][:cpu],    YELLOW)
  turn_val        = colorize(stats[:turn],            YELLOW)

  "#{div} #{round_label} #{round_num} #{div} #{score_label} " \
  "[#{player_label} #{player_score}] [#{computer_label} #{computer_score}] " \
  "#{div} #{turn_label} #{turn_val} #{div}"
end

def loading_screen
  ART['loading_screen'].each do |keyframe|
    clear_screen
    puts keyframe 
    sleep(TEXT_SPEED)
  end
end

def make_move!(choice, marker, board)
  board.map! do |row|
    if row.include?(choice)
      row.map! do |el|
        el == choice ? marker : el
      end
    else
      row
    end
  end
end

def valid_move?(choice, board)
  board.each do |row|
    row.any?(choice) ? (return true) : next
  end
  false
end

def prompt(prompt_text)
  print prompt_text
end

def get_user_input
  input = gets.chomp.downcase
  check_for_quit(input)
  input
end

def check_for_quit(input)
  if QUIT_COMMANDS.any? input
    puts "quitting"
    exit(0)
  end
end

def start_menu_system(settings)
  current_screen = 'main_menu'
  loop do
    clear_screen
    puts MENU_SCREENS[current_screen][:text]
    prompt('> ')
    input = get_user_input
    # validate user input
    # set current_screen to new state

    # possible choices:
    # play the game
    # enter the custom game screen
    # Enter the instructions screen (static)
    # Enter the credits screen (static)

  end
end

def main(settings)
  loop do
    start_menu_system(settings)

    # play_game
    puts "End of program"
    break
  end
end

default_settings = {
  wins:            5,
  ai:              :medium,
  board_size:      '3x3'
}

clear_screen
loading_screen
prompt("Press enter to start: ")
gets.chomp

clear_screen
main(default_settings)

# puts format(MSGS['custom_game'], default_settings[:wins], default_settings[:ai], default_settings[:board_size])
# puts format(MSGS['instructions'], default_settings[:wins], default_settings[:ai], default_settings[:board_size])
# puts MSGS['credit']



# board = set_board(:small)

# row = ["8", "9", "10", "11", "12", "13", "14"]
# puts format_row(row, true)

# p valid_move?('1', board) == true
# p valid_move?('4', board) == true
# p valid_move?('10', board) == false

# make_move!('1', 'X', board)
# make_move!('4', 'O', board)

# stats = {
#   round: "1",
#   scores: {player: 0, cpu: 0},
#   turn: 'YOURS!'
# }

# puts get_hud(stats)

# display_board(board)