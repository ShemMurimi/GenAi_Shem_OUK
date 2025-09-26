"""Interactive Rock-Paper-Scissors Game with Scoreboard"""

import random;

node scoreboard {
    has wins: int = 0;
    has losses: int = 0;
    has ties: int = 0;
}

walker RPSGame {
    has choice: str;   # Player's choice

    can start with `root entry {
        # Ask the player for their choice
        this.choice = input("Enter your choice (rock, paper, or scissors): ").strip().lower();
        if this.choice not in ["rock", "paper", "scissors"] {
            report f"Invalid choice: {this.choice}. Please choose rock, paper, or scissors.";
            stop;  # End this walker if invalid input
        }
        report f"Game started with choice: {this.choice}";
        visit round;
    }

    can process_choice with round entry {
        report f"Player chose: {choice}, System chose: {round.system_choice}";

        if choice == round.system_choice {
            report "It's a tie!";
            scoreboard.ties += 1;
        }
        elif (
            (choice == "rock" and round.system_choice == "scissors") or
            (choice == "paper" and round.system_choice == "rock") or
            (choice == "scissors" and round.system_choice == "paper")
        ) {
            report "Player wins!";
            scoreboard.wins += 1;
        }
        else {
            report "System wins!";
            scoreboard.losses += 1;
        }

        # Show running scoreboard
        report f"Scoreboard -> Wins: {scoreboard.wins}, Losses: {scoreboard.losses}, Ties: {scoreboard.ties}";
    }
}

node round {
    has system_choice: str = random.choice(["rock", "paper", "scissors"]);
}

# CLI entry point (interactive mode)
with entry:__main__ {
    # Create scoreboard once at root
    scoreboard_node = spawn scoreboard;

    while True {
        root spawn RPSGame();
        again = input("Play again? (yes/no): ").strip().lower();
        if again != "yes" {
            report f"Final Score -> Wins: {scoreboard.wins}, Losses: {scoreboard.losses}, Ties: {scoreboard.ties}";
            report "Thanks for playing! Goodbye 👋";
            break;
        }
    }
}
