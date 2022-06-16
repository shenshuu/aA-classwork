require_relative 'slidable.rb'
class Rook < Piece 
    include Slidable
    def symbol 
        color == :white ? '♖' : '♜'
    end

    def move_dirs
        horizontal_dirs
    end

end