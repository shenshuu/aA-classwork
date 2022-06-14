require_relative 'piece.rb'
require_relative '../directions/slidable.rb'

class Queen > Piece 
    include Slideable
    def symbol 
        'QW'
    end

    private 
    def move_dirs 
        horizontal_dirs + diagonal_dirs
    end
end