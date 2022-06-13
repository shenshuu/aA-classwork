class PolyTreeNode
    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def parent=(parent)
        return if self.parent == parent  
        if self.parent == nil
            @parent = parent  
            parent.children << self 
            return 
        else
            self.parent.children.delete(self)
        end
        @parent = parent 
        self.parent.children << self unless self.parent == nil 
        nil 
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "error" if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)
        return if self.nil?
        return self if self.value == target_value 
        self.children.each do |child|
            val = child.dfs(target_value)
            return val unless val.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift 
            return node if node.value == target_value
            node.children.each {|child| queue << child}
        end
        nil 
    end
end

