class Node
  attr_accessor :value, :left, :right

  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinaryTree
  def initialize(value)
    @root = Node.new(value)
  end

  def insert(value)
    current_node = @root

    while current_node != nil
      if value < current_node.value
        if current_node.left == nil
          current_node.left = Node.new(value)
        else
          current_node = current_node.left
        end
      elsif value > current_node.value
        if current_node.right == nil
          current_node.right = Node.new(value)
        else
          current_node = current_node.right
        end
      else
        return
      end
    end
  end
end
