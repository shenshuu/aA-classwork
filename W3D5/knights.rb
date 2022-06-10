require_relative "treenode.rb"

class KnightPathFinder

    @@offsets = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [1,-2], [2,-1]]
    def self.valid_moves(pos)
        @considered_positions = [pos]
    end 

    def new_move_positions(pos)
        #KnightPathFinder.valid_moves(pos)
        new_positions = @@offsets.map {|offset| [pos[0]+offset[0], pos[1]+offset[1]]}
        new_positions = new_positions.reject {|position| @considered_positions.include?(position)}
    end
end