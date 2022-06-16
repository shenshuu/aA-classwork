class Piece 

    attr_reader :board, :pos, :color

    def initialize(color, board, pos)
        @color = color  
        @board = board  
        @pos = pos
    end

    protected 
    def valid_pos(pos)
        row, col = pos 
        !(row < 0 || col < 0 || row >= 8 || col >= 8)
    end

end