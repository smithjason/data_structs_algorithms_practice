class Stack
  def initialize
    @stack = []
  end

  def <<(data)
    @stack << data
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def <<(data)
    @queue.unshift(data)
  end

  def pop
    @queue.pop
  end

  def peek
    @queue.last
  end

  def empty?
    @queue.empty?
  end
end
