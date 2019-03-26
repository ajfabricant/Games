puts "\n"
puts "Let's play rock, paper, scissors, lizard, Spock!"

# Initial scores

playerScore = 0
compScore = 0

puts "\n"
puts "Alright, here are the rules:"
puts "\n"
puts "Rock crushes scissors.
Rock crushes lizard.
Paper covers rock.
Paper disproves Spock.
Scissors cuts paper.
Scissors decapitates lizard.
Lizard eats paper.
Lizard poisons Spock.
Spock smashes scissors.
Spock vaporizes rock."

until playerScore == 10 || compScore == 10

  puts "\n"
  puts "Select your weapon: Rock, paper, scissors, lizard, or Spock?"

  player = gets.chomp.downcase
  comp = ["rock", "paper", "scissors", "lizard", "Spock"].sample

  # Player wins

  if (player == "rock" && comp == "scissors") ||
    (player == "rock" && comp == "lizard") ||
    (player == "paper" && comp == "rock") ||
    (player == "paper" && comp == "Spock") ||
    (player == "scissors" && comp == "paper") ||
    (player == "scissors" && comp == "lizard") ||
    (player == "lizard" && comp == "paper") ||
    (player == "lizard" && comp == "Spock") ||
    (player == "Spock" && comp == "rock") ||
    (player == "Spock" && comp == "scissors")
    puts "\n"
    puts "You won!"
    puts "\n"
    playerScore += 1
    puts ("#{player} beats #{comp}!").capitalize
    puts "Score: Player #{playerScore} | Comp #{compScore}"

  # Draws

  elsif (player == "rock" && comp == "rock") ||
    (player == "paper" && comp == "paper") ||
    (player == "scissors" && comp == "scissors") ||
    (player == "lizard" && comp == "lizard") ||
    (player == "Spock" && comp == "Spock")
    puts "\n"
    puts "Draw! No point awarded."
    puts "\n"
    puts "Score: Player #{playerScore} | Comp #{compScore}"

  # Comp wins

  else compScore += 1
    puts "\n"
    puts "You lost!"
    puts "\n"
    puts ("#{comp} beats #{player}!").capitalize
    puts "Score: Player #{playerScore} | Comp #{compScore}"
  end

end

# Who won?

puts "\n"
puts playerScore > compScore ? ("You won!").upcase : ("Comp wins!").upcase

# Final score

puts "\n"
puts "FINAL SCORE: Player #{playerScore} | Comp #{compScore}"

# Final draw

puts "\n"
puts "FINAL DRAW: Player drew #{player} | Comp drew #{comp}"

# Play again?

def restart

  puts "\n"
  puts "Play again? (Y/N)"
  answer = gets.chomp.downcase

  if answer == "y"
    load "RPSLS.rb"
  elsif answer == "n"
    abort("Thanks for playing!")
  else
    puts restart
  end

end

puts restart
