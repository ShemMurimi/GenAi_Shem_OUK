"""A Number Guessing Game"""

import random;
import from byllm.llm { Model }

# glob llm = Model(model_name="gpt-4o",verbose=False);
 glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: int, correct_number: int) -> str by llm();

walker GuessGame {
    has guess: int;

    can process_guess with turn entry {
        # Implement the logic for processing a guess
        if self.guess == turn.correct_number {
            print("Congratulations! You guessed the correct number.");
        } else {
            print(give_hint(self.guess, turn.correct_number));
        }
    }
}

node turn {
    has correct_number: int = random.randint(1, 10);
}

# Will run when in CLI mode (not in cloud)
 with entry:__main__ {
    root spawn GuessGame(3);
    root spawn GuessGame(4);
    root spawn GuessGame(5);
    root spawn GuessGame(6);
}