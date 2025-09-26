impl RPSGame.start {
    if not [root --> (`?round)] {
        next = root ++> round(random.choice(["rock", "paper", "scissors"]));
    } else {
        next = [root --> (`?round)];
    }
    visit next;
}

impl RPSGame.process_choice {
    if [-->] {
        visit [-->];
    } else {
        if self.choice == here.system_choice {
            print("It's a tie! Both chose " + self.choice);
        } elif (
            (self.choice == "rock" and here.system_choice == "scissors") or
            (self.choice == "paper" and here.system_choice == "rock") or
            (self.choice == "scissors" and here.system_choice == "paper")
        ) {
            print("You win! " + self.choice + " beats " + here.system_choice);
        } else {
            print("You lose! " + here.system_choice + " beats " + self.choice);
        }
        disengage;
    }
}
