 🪨📄✂️ Rock-Paper-Scissors (JacLang)

An interactive Rock-Paper-Scissors game built using [JacLang](https://jaseci.org/).
This project demonstrates modular design in Jac by separating the game logic from the scoreboard for cleaner management and scalability.

📂 Project Structure

Rock_Paper_Scissors
│
├── rock_ps5.jac        # Main game logic (walker, round node, CLI loop)
├── scoreboard.jac      # Scoreboard node (wins, losses, ties tracking)
└── README.md           # Documentation


🚀 How to Run

1. Clone the repository

   bash
   git clone <your-repo-url>
   cd Rock_Paper_Scissors

2. Run the game with Jac
   Make sure you are inside the project folder, then run:

   bash
   jac rock_ps5.jac scoreboard.jac

3. Play interactively

    Enter your choice: `rock`, `paper`, or `scissors`
    The system will generate a random choice.
    The scoreboard updates automatically.
    You can keep playing until you type **no** when asked *"Play again?"*.

🎮 Features

 Interactive command-line gameplay.
 Keeps track of Wins, Losses, and Ties across multiple rounds.
 Scoreboard implemented as a separate module (`scoreboard.jac`) for modularity.
 Clean JacLang walker + node design.

🛠️ Example Gameplay

text
Enter your choice (rock, paper, or scissors): rock
Game started with choice: rock
Player chose: rock, System chose: scissors
Player wins!
Scoreboard -> Wins: 1, Losses: 0, Ties: 0

Play again? (yes/no): yes


Next Steps (Possible Improvements)

 Add Player vs Player mode.
 Store scoreboard results in a file or database for persistence.
 Deploy with `jac serve` to expose as an API endpoint.
 
 📄 License

This project is open-source and free to use.
