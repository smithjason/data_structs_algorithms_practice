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

  def inorder_traversal(node = @root)
    return nil if node == nil

    inorder_traversal(node.left)
    puts node.value.to_s
    inorder_traversal(node.right)
  end

  def preorder_traversal(node = @root)
    return nil if node == nil

    puts node.value.to_s
    preorder_traversal(node.left)
    preorder_traversal(node.right)
  end

  def postorder_traversal(node = @root)
    return nil if node == nil

    postorder_traversal(node.left)
    postorder_traversal(node.right)
    puts node.value.to_s
  end
end

tree = BinaryTree.new(20)
tree.insert(10)
tree.insert(30)

puts "INORDER"
tree.inorder_traversal

puts "PREORDER"
tree.preorder_traversal

puts "POSTORDER"
tree.postorder_traversal
