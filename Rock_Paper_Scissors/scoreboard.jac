"""Scoreboard module for Rock-Paper-Scissors"""
node scoreboard {
    has wins: int = 0;
    has losses: int = 0;
    has ties: int = 0;

    can show with `root entry {
        report f"Scoreboard -> Wins: {wins}, Losses: {losses}, Ties: {ties}";
    }

    can final with `root entry {
        report f"Final Score -> Wins: {wins}, Losses: {losses}, Ties: {ties}";
    }
}
