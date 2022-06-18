class Stack 
    def initialize
        @stack = []
    end


    def size 
        @stack.length
    end

    def empty?
        @stack.length == 0
    end

    def pop 
        raise 'cannot pop from empty stack' if empty?
        @stack.pop 
    end

    def push(item)
        @stack << item 
    end

    
end