require_relative "treenode.rb"
require "set"
# require 'byebug'

class KnightPathFinder
    
    @@offsets = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [1,-2], [2,-1]]
    
    def initialize(pos)
        @considered_positions = Set.new([pos])
        @pos = pos 
    end
    
    def self.valid_moves(pos)
        @@offsets.map {|offset| [pos[0]+offset[0], pos[1]+offset[1]]}
    end 

    def valid_pos?(pos)
        row, col = pos 
        row >= 0 && row <= 7 && col >= 0 && col <= 7
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos)
        new_positions = new_positions.reject {|position| @considered_positions.include?(position) || !valid_pos?(position)}
        new_positions.each {|position| @considered_positions << position}
        new_positions
    end

    def build_move_tree 
        root = PolyTreeNode.new(@pos)
        head = root 
        queue = [root]

        until queue.empty?
            root = queue.shift 
            new_positions = new_move_positions(root.value)
            new_positions.each do |pos|
                child = PolyTreeNode.new(pos)
                child.parent = root 
                queue << child 
            end
        end
        head 
    end

    def find_path(end_pos)
        root = build_move_tree
        node = root.dfs(end_pos)
        trace_path_back(node)
    end
    
    def trace_path_back(node)
        path = []
        until node.parent.nil?
            path << node.value
            node = node.parent
        end
        path << [@pos]
        path.reverse
    end
end

k = KnightPathFinder.new([0,0])
p k.find_path([7,6])
# p k.find_path([6,2])