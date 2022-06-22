class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
  end

  def []=(i, val)
    @store[i] = val 
  end

  def capacity
    @store.length
  end

  def include?(val)
    for i in 0...self.count 
      return true if @store[i] == val 
    end
    return false 
  end

  def push(val)
    self[self.count] = val 
    self.count += 1
  end

  def unshift(val)
  end

  def pop
    if self.count > 0 
      item = self.last 
      @store[self.count] = nil 
      self.count -= 1
      return item 
    end
  end

  def shift
  end

  def first
    self[0]
  end

  def last
    self[self.count-1] if self.count > 0 
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
