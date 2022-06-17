require 'set'

class Array
    def my_uniq
        Set.new(self).to_a
    end

    def two_sum 
        positions = []
        for i in 0...self.length do 
            for j in i+1...self.length do 
                if self[i] + self[j] == 0 
                    positions << [i,j]
                end
            end
        end
        positions
    end

    def my_transpose 
        raise ArgumentError if self.any? {|ele| !ele.is_a?(Array)}
        transposed = Array.new(self[0].length) {Array.new(self.length)}
        for i in 0...self.length 
            for j in 0...self[0].length
                transposed[j][i] = self[i][j]
            end
        end
        transposed
    end

end


arr = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
p [1,1,1].my_uniq
p arr.my_transpose