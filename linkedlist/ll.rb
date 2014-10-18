class LinkedList
  attr_accessor :head, :tail
  Node = Struct.new(:value, :next)

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
  end

  def <<(value)
    current = @head

    while(current.next)
      current = current.next
    end

    current.next = Node.new(value)
    @tail = current.next
  end

  def each
    if block_given? and @head
      current = @head

      while(current.next)
        yield(current.value)
        current = current.next
      end

      yield(current.value)
    end
  end

  def map
    if block_given? and @head
      current = @head
      temp_list = LinkedList.new(yield(current.value))

      current.next

      while(current.next)
        temp_list << yield(current.value)
        current = current.next
      end

      temp_list << yield(current.value)

      temp_list
    end
  end
end
