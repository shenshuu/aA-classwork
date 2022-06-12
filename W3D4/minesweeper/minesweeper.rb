require_relative 'board.rb'
class Minesweeper

    def initialize
        @game = Board.new 
        @remaining_spaces = @game.remaining_spaces
    end

    def flag(pos)
        @game[pos].flag = !@game[pos].flag
    end

    def make_move 
        pos = nil 
        until pos && valid_move?(pos)
            begin 
                puts "Please enter a valid position: "
                pos = gets.chomp.split(" ").map {|ele| ele.to_i}
            rescue
                pos = nil 
            end
        end
        pos 
    end

    def valid_move?(move)
        move.is_a?(Array) &&
        move[0].is_a?(Integer) &&
        move[1].is_a?(Integer) &&
        @game.valid_pos?(move)
    end

    # def play 

    # end
end 