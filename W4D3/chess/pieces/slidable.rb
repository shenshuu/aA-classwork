module Slidable
    HORIZONTAL_DIRS = [[0,1], [0,-1], [-1,0], [1,0]]
    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        move_dirs.each do |dx, dy|
            moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        moves 
    end

    private 
    def grow_unblocked_moves_in_dir(dx, dy)
        debugger
        curr_x, curr_y = pos 
        possible_moves = []
        while true 
            debugger
            curr_x, curr_y = curr_x + dx, curr_y + dy 
            pos = [curr_x, curr_y]
            debugger
            if valid_pos(pos) && board[curr_x][curr_y].instance_of?(NullPiece)
                possible_moves << pos 
            else
                debugger
                if valid_pos(pos)
                    possible_moves << pos if board[curr_x][curr_y].color != color
                end
                break  
            end
        end
        possible_moves
    end

    def move_dirs 
        raise "move_dirs not defined in subclass"
    end
end