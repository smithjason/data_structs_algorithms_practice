=begin

  Implementing Hashtable using an Array and Node/LinkedList

=end

class Node
  attr_accessor :key, :value, :next

  def initialize(key, value = nil)
    @key = key
    @value = value
    @next = nil
  end
end

class LinkedList
  def initialize(key, value)
    @head = Node.new(key, value)
  end


  def [](key)
    if(@head.key == key)
      return @head
    else
      current = @head
      while(current.next && current.key != key)
        current = current.next
      end
      if current.key == key
        return current
      else
        return nil
      end
    end
  end

  def []=(key, value)
    node = self[key]
    node ? node.value = value : self.add(key, value)
  end

  private

  def add(key, value)
    current = @head

    while(current.next)
      current = current.next
    end

    current.next = Node.new(key, value)
    self
  end
end

class HashTable
  attr_accessor :table

  TABLE_SIZE = 137
  PRIME_MULTIPLIER = 37

  def initialize
    @table = Array.new(TABLE_SIZE)
  end

  def []=(key, value)
    bucketIndex = prehash(key)

    if !@table[bucketIndex]
      @table[bucketIndex] = LinkedList.new(key, value)
    else
      @table[bucketIndex][key] = value
    end
  end

  def [](key)
    bucketIndex = prehash(key)
    @table[bucketIndex] ? @table[bucketIndex][key].value : nil
  end

  private

  def prehash(key)
    code_values = key.split("").map do |individual_char|
      individual_char.ord
    end

    prehash = code_values.reduce do |total, value|
      total * PRIME_MULTIPLIER + value
    end

    prehash %= TABLE_SIZE

    if(prehash < 0)
      prehash += TABLE_SIZE - 1
    end

    prehash
  end
end
