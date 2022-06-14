require_relative './piece/piece.rb'
class Board

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = Piece.new 
        self[[0,0]] = @null_piece
    end

    def [](pos)
        row, col = pos 
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos 
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)

    end

    def valid_pos?(pos)
        row, col = pos 
        !(row < 0 || col < 0 || row >= 8 || col >= 8)
    end

    def move_piece(start_pos, end_pos)
        #raise error if no piece at start_pos 
        #raise error if end_pos is illegal move
        raise "Piece does not exist" if self[start_pos].nil?
        #raise "Illegal move" if !valid_moves.include? self[end_pos]
    end
end