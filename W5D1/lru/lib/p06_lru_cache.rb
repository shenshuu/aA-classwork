require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    calc!(key) if !@map.include?(key)
    if self.count > max 
      curr = @store.head 
      while curr.key != key 
        curr = curr.next 
      end
      update_node(curr)
      eject!
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @map.set(key, prc.call(key))
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @store.remove(node.key)
    @store.append(node.key, node.val)
  end

  def eject!
    deleted_key = @store.first.key
    @map.delete(deleted_key)
    @store.remove(deleted_key)
  end
end
