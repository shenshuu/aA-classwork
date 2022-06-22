class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail, :size 
  def initialize
    @head, @tail = Node.new, Node.new 
    @head.next, @tail.prev = @tail, @head 
    @size = 0 
  end

  def [](i)
    if i < self.size 
      curr = self.head 
      while i >= 0 
        curr = curr.next
        i -= 1 
      end
      return curr
    end
  end

  def first
    if self.size > 0 
      return head.next 
    end 
  end

  def last
    if self.size > 0 
      return tail.prev 
    end
  end

  def empty?
    @size == 0 
  end

  def get(key)
    curr = self.head 
    while curr != nil 
      return curr.val if curr.key == key
      curr = curr.next 
    end
    return nil 
  end

  def include?(key)
    curr = self.head 
    while curr != nil 
      return true if curr.key == key
      curr = curr.next 
    end
    return false 
  end

  def append(key, val)
    prev = tail.prev 
    node = Node.new(key, val)
    node.next, node.prev = tail, prev 
    prev.next, tail.prev = node, node 
    @size += 1
  end

  def update(key, val)
    curr = self.head 
    while curr != nil 
      curr.val = val if curr.key == key
      curr = curr.next 
    end
  end

  def remove(key)
    if self.size > 0 
      removed = self.head 

      while removed.key != key 
        removed = removed.next 
      end

      prv, nxt = removed.prev, removed.next 
      prv.next, nxt.prev = nxt, prv 
      self.size -= 1
    end
  end

  def each
    curr = self.head.next  
    while curr != self.tail  
      yield curr 
      curr = curr.next 
    end
  end


  #uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
