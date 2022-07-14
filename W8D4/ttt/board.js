class Board {
    constructor() {
        this.board = [];
        for (let i = 0; i < 3; i++) {
            this.board.push(new Array(3).fill(" "));
        }
        this.winningPlayer = undefined;
    }   

    winner() {
        this.won();
        return this.winningPlayer;
    }

    won() {
        const that = this;
        function row() {
            for (let i = 0; i < 3; i++) {
                let count = 0;
                for (let j = 0; j < 2; j++) {
                    if (that.board[i][j] === that.board[i][j+1]) count += 1;
                    if (count === 2) {
                        that.winningPlayer = that.board[i][j]
                        return true;
                    }
                }
            }
            return false;
        }

        function col() {
            for (let i = 0; i < 3; i++) {
                let count = 0
                for (let j = 0; j < 2; j++) {
                    if (that.board[j][i] === that.board[j+1][i]) count += 1
                    if (count === 2) {
                        that.winningPlayer = that.board[i][j]
                        return true;
                    }
                }
            }
            return false;
        }

        function diag() {
            let posDiagCount = 0;
            let negDiagCount = 0;
            for (let i = 0; i < 2; i++) {
                if (that.board[i][i] === that.board[i+1][i+1]) posDiagCount += 1
                if (that.board[i][2-i] === that.board[i+1][1-i]) negDiagCount += 1
                if (posDiagCount === 2 || negDiagCount === 2) that.winningPlayer = that.board[1][1];
            }
            return posDiagCount === 2 || negDiagCount === 2;
        }
        return row() || col() || diag();
    }

    empty(pos) {
        return this.board[pos[0]][pos[1]] === " ";
    }

    place_mark(pos, mark) {
        this.board[pos[0]][pos[1]] = mark;
    }

    print() {
        for (let i = 0; i < 3; i++) {
            console.log(`|${this.board[i][0]}|${this.board[i][1]}|${this.board[i][2]}|`)
        }
    }
}

let b = new Board();
b.place_mark([0,2], 'X');
b.place_mark([1,1], 'X');
b.place_mark([2,0], 'X');
b.print();
console.log(b.winner());

module.exports = Board;