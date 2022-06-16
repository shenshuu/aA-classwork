require_relative 'pieces/piece.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/piece.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/null_piece.rb'
require 'byebug'

class Board
    def initialize
        @board = Array.new(8) {Array.new(8)}
        init_board
        @board[6][4] = NullPiece.new 
        @board[6][2] = NullPiece.new 
        @board[6][3] = NullPiece.new
    end

    def [](pos)
        row, col = pos 
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos 
        @board[row][col] = val 
    end

    def init_board 
        #clear the board 
        @board = Array.new(8) {Array.new(8)}
        initialize_pieces
    end

    def empty?(pos)
        self[pos].instance_of?(NullPiece)
    end

    private 
    def initialize_pawns 
        (0..7).each {|i| @board[1][i] = Pawn.new(:white, @board, [1,i]), @board[6][i] = Pawn.new(:black, @board, [6,i])}
    end

    def initialize_rooks 
        @board[7][0], @board[7][7] = Rook.new(:black, @board, [7,0]), Rook.new(:black, @board, [7,6])
        @board[0][0], @board[0][7] = Rook.new(:white, @board, [0,0]), Rook.new(:white, @board, [0,6])
    end

    def initialize_bishops 
        @board[7][2], @board[7][5] = Bishop.new(:black, @board, [7,2]), Bishop.new(:black, @board, [7,5])
        @board[0][2], @board[0][5] = Bishop.new(:white, @board, [0,2]), Bishop.new(:white, @board, [0,5])
    end

    def initialize_queens
        @board[0][3] = Queen.new(:white, @board, [0,3])
        @board[7][3] = Queen.new(:black, @board, [7,3])
    end 

    def initialize_knights 
        @board[0][1], @board[0][6] = Knight.new(:white, @board, [0,1]), Knight.new(:white, @board, [0,6]) 
        @board[7][1], @board[7][6] = Knight.new(:black, @board, [7,1]), Knight.new(:black, @board, [7,6])
    end

    def initialize_kings 
        @board[0][4] = King.new(:white, @board, [0,4])
        @board[7][4] = King.new(:black, @board, [7,4])
    end

    def initialize_empty
        (2..5).each do |row|
            (0..7).each do |col|
                pos = [row, col]
                self[pos] = NullPiece.new 
            end
        end
    end

    def initialize_pieces 
        initialize_pawns
        initialize_bishops
        initialize_queens
        initialize_rooks
        initialize_knights
        initialize_kings
        initialize_empty
    end
end

b = Board.new 
p b[[7,3]].moves