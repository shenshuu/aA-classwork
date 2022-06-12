require_relative 'board.rb'
class Minesweeper

    def initialize
        @game = Board.new 
    end

    def flag(pos)
        @game[pos].flag = !@game[pos].flag
    end

    def play 

    end
end 