require_relative 'tile.rb'

class Board 

    @@offsets = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]]

    attr_reader :remaining_spaces
    def initialize
        @grid = Array.new(9) {Array.new(9)}
        for i in 0...@grid.length do 
            for j in 0...@grid.length do 
                pos = [i, j]
                self[pos] = Tile.new 
            end
        end
        @remaining_spaces = @grid.length * @grid.length 
        self.populate
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def populate
        num_bombs = 15

        while num_bombs > 0 
            bomb_pos = get_empty_spaces.sample
            self[bomb_pos].create_bomb
            mark_neighbors(bomb_pos)
            @remaining_spaces -= 1
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

    def fill(pos)
        return if @grid[pos] != 0 || !valid_pos?(pos)
        @remaining_spaces -= 1
        @grid[pos].reveal, @grid[pos] = true, "_"
        neighbors = @@offsets.map {|offset| [pos[0] + offset[0], pos[1] + offset[1]]}
        neighbors.each {|tile_pos| fill(tile_pos)}
    end

    def mark_neighbors(pos)
        row, col = pos[0], pos[1]
        neighbors = @@offsets.map {|offset| [row + offset[0], col + offset[1]]}
        valid_neighbors = neighbors.select {|pos| valid_pos?(pos) && empty?(pos)}
        valid_neighbors.each {|neighbor| self[neighbor].value += 1}
    end

    def valid_pos?(pos)
        row, col = pos[0], pos[1]
        return row >= 0 && row < @grid.length && col >= 0 && col < @grid.length
    end 
    
    def empty?(pos)
        self[pos].value.is_a?(Integer)
    end

    def render
        # @grid.each {|row| puts row.join(" ")}
        for i in 0...@grid.length do 
            row = []
            for j in 0...@grid.length do 
                if self[[i,j]].reveal
                    row << self[[i,j]].value 
                else
                    row << "*" 
                end
            end
            puts row.join(" ")
        end
    end
end

b = Board.new
b.populate
b.render