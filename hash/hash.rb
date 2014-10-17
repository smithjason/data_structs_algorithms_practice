=begin

  Implementing Hashtable using an Array and Node/LinkedList

=end

class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(value)
  end

  def <<(value)
    current = @head

    while(current.next)
      current = current.next
    end

    current.next = Node.new(value)
    self
  end

  def [](index)
    return nil if index < 0

    current = @head
    i = 0

    begin
      while(i < index)
        current = current.next
        i += 1
      end
      return current
    rescue
      return nil
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

  def [](key, value)
    prehashedIndex = prehash(key)
    index = 0

    if !@table[prehashedIndex]
      @table[prehashedIndex]
    else

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

    prehash
  end
end
