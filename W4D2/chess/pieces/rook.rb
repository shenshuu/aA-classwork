require_relative 'piece.rb'
require_relative '../directions/slidable.rb'

class Rook > Piece 
    include Slideable
    def symbol 
        'RW'
    end

    private 
    def move_dirs 
        horizontal_dirs
    end
end