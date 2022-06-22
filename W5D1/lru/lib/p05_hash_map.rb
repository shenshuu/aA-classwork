require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).get(key) != nil 
  end

  def set(key, val)
    node = get(key)
    if node == nil 
      bucket(key).append(key, val)
      self.count += 1
      resize! if self.count == @store.length 
    else 
      #OVERWRITE EXISTING NODE VALUE 
      bucket(key).update(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    self.count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |ele|
        yield [ele.key, ele.val] 
      end
    end
  end

  #uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) {LinkedList.new}
    @store.each do |bucket|
      bucket.each do |item|
        temp[item.hash % (num_buckets * 2)].append(item.key, item.val)
      end
    end
    @store = temp 
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
