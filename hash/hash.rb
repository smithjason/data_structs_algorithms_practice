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

  # add
  def add(key, value)
    current = @head

    while(current.next)
      current = current.next
    end

    current.next = Node.new(key, value)
    self
  end

  # find a node with the provided key and return it
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

  # find a node with the provided key and set Node.value to value
  def []=(key, value)
    if self[key]
      self[key].value = value
    else
      self.add(key, value)
    end
  end
end

class HashTable
  attr_accessor :table

  TABLE_SIZE = 137
  PRIME_MULTIPLIER = 37

  def initialize
    @table = buildChains
  end

  def []=(key, value)
    bucketIndex = prehash(key)
    index = 0

    if !@table[bucketIndex]
      @table[bucketIndex] = LinkedList.new(value)
    else
      @table[bucketIndex][key] = value
    end
  end

  private

  def buildChains
    Array.new(TABLE_SIZE)
  end

  def prehash(key)
    code_values = key.split("").map do |individual_char|
      individual_char.ord
    end

    prehash = code_values.reduce do |total, value|
      total * PRIME_MULTIPLIER + value
    end
  end
end
