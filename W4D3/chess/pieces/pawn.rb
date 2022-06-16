class Pawn < Piece 
    def symbol 
        color == :white ? '♙' : '♟'
    end

    def moves

    end

    def at_start_row?
        #if row 1 or 6 return true else false
    end

    def forward_dir

    end

    def forward_steps
        #if 
    end

    def side_attacks
        #if y -1 || +1 has a piece thats not null and not same color
    end
end