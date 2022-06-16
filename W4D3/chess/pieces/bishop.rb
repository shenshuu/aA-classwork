require_relative 'slidable.rb'
class Bishop < Piece 

    include Slidable
    def symbol
        color == :white ? '♗' : '♝'
    end

    def move_dirs
        diagonal_dirs
    end

end