require_relative 'slidable.rb'
class Queen < Piece 
    include Slidable
    def symbol 
        color == :white ? '♕' : '♛'
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end