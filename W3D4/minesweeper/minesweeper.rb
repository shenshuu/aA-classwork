require_relative 'board.rb'
class Minesweeper

    def initialize
        @game = Board.new 
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
        @game.valid_pos?(move) &&
        !self[move].reveal
    end

    def won?
        @game.remaining_spaces == 0
    end

    def play 
        while !won?
            pos = make_move 
            @game.fill(pos) if self[pos].value == 0
            break if self[pos].bomb 
            system("clear")
            @game.render 
        end
    end

end 