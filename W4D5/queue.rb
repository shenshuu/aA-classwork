class MyQueue 
    def initialize 
        @queue = []
    end

    def enqueue(item)
        @queue << item 
    end

    def dequeue 
        raise 'cannot remove elements from empty queue' if empty?
        @queue.shift 
    end

    def empty?
        @queue.length == 0
    end

    def size 
        @queue.length 
    end

    def peek 
        raise 'cannot view first element of empty queue' if empty?
        @queue[0]
    end
end