class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    big_integer = 0
    return 0 if self.empty?
    for i in 0...self.length
      big_integer += self[i].ord * (128 ** i)
    end
    return big_integer % self.length 
  end
end

class String
  def hash
    random_num = 0
    for i in 0...self.length 
      random_num += self[i].ord * (128 ** i)
    end
    return random_num % self.length 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
