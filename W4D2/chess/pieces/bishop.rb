require_relative 'piece.rb'
require_relative '../directions/slidable.rb'

class Bishop > Piece 
    include Slideable
    def symbol 
        'BW'
    end

    private 
    def move_dirs 
        diagonal_dirs
    end
end