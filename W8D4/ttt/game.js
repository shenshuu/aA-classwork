let Board = require('./board.js')

function Game(reader) {
    this.reader = reader;
    this.board = new Board();
    this.player1 = new HumanPlayer('X', this.board);
    this.player2 = new HumanPlayer('O', this.board);
    this.currentPlayer = this.player1;
}

Game.prototype.isWon = function() {
    this.board.won();
}

Game.prototype.switchPlayer = function() {
    if (this.currentPlayer === this.player1)
        this.currentPlayer = this.player2;
    else
        this.currentPlayer = this.player1;
}

Game.prototype.promptMove = function() {
    const that = this;
    this.reader.question('Enter position:', function(pos) {
        pos = pos.split(" ").map(x => parseInt(x));
        that.currentPlayer.makeMove(pos);
        that.switchPlayer();
        that.board.print();
    })
}

Game.prototype.run = function(reader, completionCallback) {
    const that = this;
    if (!that.isWon()) {
        // Continue to play!
        this.promptMove(reader, (pos) => {
        that.run(reader, completionCallback)});
        
    } else {
        that.board.print();
        console.log("You win!");
        completionCallback();
      }
    };

class Player {
    constructor(mark, board) {
        this.board = board;
        this.mark = mark;
    }

    makeMove(pos) {
        let m = this.board.board.length;
        let n = this.board.board[0].length;
        
        if (pos[0] < 0 || pos[1] < 0 || pos[0] >= m || pos[1] >= n)
            throw new Error("invalid position");
        if (this.board.board[pos[0]][pos[1]] === " ")
            this.board.place_mark(pos, this.mark);
    }
}

class ComputerPlayer extends Player {}
class HumanPlayer extends Player {}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const g = new Game(rl);
g.run(rl, g.board.winner);