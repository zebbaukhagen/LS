require 'yaml'

ART = YAML.load_file('ttt_art.yml')
MSGS = YAML.load_file('ttt_msgs.yml')

TEXT_SPEED = 0.01

=begin
Tic tac toe CLI game
--------------------

Features:
1. Dynamic menu states (can move back and forward)
2. Variable difficulties (easy, medium, hard, nightmare)
3. Variable board sizes
4. Board refreshes instead of printing again
5. Ability to quit at any point
6. Greeting / farewell
7. Pause between player and computer turns to simulate computation
8. Clear instructions screen
9. Beautiful intro/win/loss screens
10. UI prompt line with info like scores/turn/etc
11. Variable first-turn advantage (player first, computer first, computer chooses)
12. Whoever lost last round gets to go first this round
13. Maybe more than 2 players? idk
14. Variable number of rounds

Overview:

START
- Display fake loading screen
- Display intro screen
  - Wait for user to press a key
- Display main menu and wait for player choice
- Play (default settings)
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

def red(text)
  "\e[31m#{text}\e[0m"
end

def green(text)
  "\e[32m#{text}\e[0m"
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
    colored_el = el.match?(/[1-9]/) ? red(el) : green(el)
    double_digit && el.size < 2 ? colored_el.prepend(' ') : colored_el
  end.join(' | ')
  ' ' + formatted_row + ' '
end

def clear_screen
  system('clear')
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
        if el == choice
          el = marker
        else
          el
        end
      end
    else
      row
    end
  end
end


# row = ["8", "9", "10", "11", "12", "13", "14"]
# puts format_row(row, true)

board = set_board(:small)
make_move!('1', 'X', board)
make_move!('10', 'O', board)
display_board(board)