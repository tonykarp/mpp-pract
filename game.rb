def determine_winner(user_choice, computer_choice)
  if user_choice == computer_choice
    "It's a tie!"
  elsif (user_choice == "rock" && computer_choice == "scissors") ||
        (user_choice == "paper" && computer_choice == "rock") ||
        (user_choice == "scissors" && computer_choice == "paper")
    "You win!"
  else
    "You lose!"
  end
end

if ARGV.length != 2
  puts "Usage: ruby game.rb [your_choice] [computer_choice]"
else
  user_choice = ARGV[0].downcase
  computer_choice = ARGV[1].downcase

  valid_choices = ["rock", "paper", "scissors"]

  if !valid_choices.include?(user_choice) || !valid_choices.include?(computer_choice)
    puts "Invalid choice. Please choose from rock, paper, or scissors."
  else
    result = determine_winner(user_choice, computer_choice)
    puts result
  end
end
