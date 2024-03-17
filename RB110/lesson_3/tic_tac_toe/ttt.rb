require 'yaml'

ART = YAML.load_file('ttt_art.yml')
MSGS = YAML.load_file('ttt_msgs.yml')

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
9. Beautiful into/win/loss screens
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

 O | X |   
--- --- ---
   |   |  
--- --- --- 
    |   |  

=> choose:

=end

def red(text)
  "\e[31m#{text}\e[0m"
end

def green(text)
  "\e[32m#{text}\e[0m"
end

board = [
  [red('1'), red('2'), " "],
  [" ", " ", " "],
  [" ", " ", " "]
]

def display_board(board)
  line = '-----------'
  puts format(' %s | %s | %s ', board[0][0], board[0][1], board[0][2])
  puts line
  puts format(' %s | %s | %s ', board[1][0], board[1][1], board[1][2])
  puts line
  puts format(' %s | %s | %s ', board[2][0], board[2][1], board[2][2])
end

def clear_screen
  system('clear')
end

def loading_screen
  
end

clear_screen
puts ART['ascii_art']