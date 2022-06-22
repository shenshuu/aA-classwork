class MaxIntSet

  attr_reader :store 
  def initialize(max)
    @store = [false] * (max+1)
    @max = max 
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true 
    return true 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num > @max || num < 0
    return true 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num 
    return true 
  end

  def remove(num)
    self[num].pop 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      resize! if @count + 1 == num_buckets
      self[num] << num 
      @count += 1
      return true 
    else
      return false 
    end
  end

  def remove(num)
    pos = self[num].index(num)
    return if pos == nil
    self[num].delete_at(pos)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        temp[ele.hash % (2 * num_buckets)] << ele 
      end
    end
    @store = temp 
  end
end
