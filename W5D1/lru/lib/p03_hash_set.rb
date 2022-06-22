class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key] << key 
      @count += 1
    end
    resize! if @count + 1 == num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    pos = self[key].index(key)
    return if pos == nil 
    self[key].delete_at(pos)
    @count -= 1
    return true 
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        temp[ele.hash] << ele 
      end
    end
    @store = temp 
  end
end
