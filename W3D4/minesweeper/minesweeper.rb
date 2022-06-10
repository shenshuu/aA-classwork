require_relative 'board.rb'
class Minesweeper

    @@offsets = [[1,0],[0,1],[-1,0],[0,-1],[1,1],[-1,-1],[-1,1],[1,-1]]
    def initialize
        @game = Board.new 
    end

    def fill(pos)
        return if @game[pos] != 0
        @game[pos].reveal, @game[pos] = true, "_"
        neighbors = @@offsets.map {|offset| [pos[0] + offset[0], pos[1] + offset[1]]}
        neighbors.each {|tile_pos| fill(tile_pos)}
    end

    def flag(pos)
        @game[pos].flag = !@game[pos].flag
    end

end 