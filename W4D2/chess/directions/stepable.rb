module Stepable
    directions = move_diffs 

    def moves 
        possible_moves = []
        curr_x, curr_y = pos 
        directions.each do |dx, dy| 
            curr_x, curr_y = curr_x + dx, curr_y + dy 
            pos = [curr_x, curr_y]
            if board.empty?
                possible_moves << pos 
            else 
                possible_moves << pos if board[pos].color != color 
            end 
        end
        possible_moves
    end
end