module Slideable 
    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]
    HORIZONTAL_DIRS = [[-1,0], [1,0], [0,-1], [0,1]]

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def moves
        moves = []
        directions = move_dirs 
        directions.each do |dx, dy|
            moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        moves 
    end

    private

    def move_dirs 
        # if instance_of?(Bishop)
        #     DIAGONAL_DIRS
        # elsif instance_of?(Rook)
        #     HORIZONTAL_DIRS
        # else 
        #     DIAGONAL_DIRS + HORIZONTAL_DIRS
        # end
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        curr_x, curr_y = pos 
        possible_moves = [] 

        while true 
            curr_x, curr_y = curr_x + dx, curr_y + dy 
            pos = [curr_x, curr_y]
            if board.empty? #change later 
                possible_moves << pos 
            else 
                possible_moves << pos if board[pos].color != color 
                break
            end 
        end
        possible_moves
    end
end
