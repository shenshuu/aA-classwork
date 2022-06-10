require_relative 'tile.rb'
#require "byebug"

class Board 

    @@offsets = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]]

    def initialize
        @grid = Array.new(9) {Array.new(9, Tile.new)}
        @empty_spaces = @grid.length * @grid.length 
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def populate
        num_bombs = 9

        while num_bombs > 0 
            #debugger
            bomb_pos = get_empty_spaces.sample
            self[bomb_pos].create_bomb
            mark_neighbors(bomb_pos)
            @empty_spaces -= 1
            num_bombs -= 1
        end
    end

    def get_empty_spaces 
        empty_spaces = []
        for row in 0...@grid.length 
            for col in 0...@grid.length 
                empty_spaces << [row, col] if @grid[row][col].value.is_a?(Integer)
            end
        end
        empty_spaces
    end

    def mark_neighbors(pos)
        row, col = pos[0], pos[1]
        neighbors = @@offsets.map {|increments| [row + increments[0], col + increments[1]]}
        valid_neighbors = neighbors.select {|pos| valid_pos?(pos)}
        #debugger
        valid_neighbors.each {|neighbor| self[neighbor].value += 1}
    end

    def valid_pos?(pos)
        row, col = pos[0], pos[1]
        return row >= 0 && row < @grid.length && col >= 0 && col < @grid.length && empty?(pos)
    end 
    
    def empty?(pos)
        self[pos].value.is_a?(Integer)
    end

end

b = Board.new
b.populate