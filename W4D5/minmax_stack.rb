class MinMaxStack 
    def initialize
        @stack = []
    end

    def peek 
        raise 'cannot peek from empty stack' if empty?
        @stack[-1]
    end

    def empty?
        @stack.length == 0 
    end

    def pop 
        raise 'cannot pop from empty stack' if empty?
        @stack.pop 
    end

    def push(item) 
        if empty? 
            @stack << [item, item, item]
        else
            @stack << [item, [item, min].min, [item, max].max]
        end
    end

    def max 
        peek[2]
    end

    def min 
        peek[1]
    end

    def size 
        @stack.length 
    end

end
