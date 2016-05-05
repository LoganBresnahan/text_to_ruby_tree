class Node
  attr_reader :identifier, :children
  attr_accessor :value, :parent, :parent_collection

  def initialize(identifier)
    @identifier = identifier
    @value = 0
    @parent = nil
    @parent_collection = []
    @children = []
  end

  def clear_parent_collection(node_a, node_b)
    node_a.parent_collection = []
    node_b.parent_collection = []
  end

  def add_child(child)
    @children << child
    child.parent = self
  end

  def node_child_value_add(node, value)
    node.children.each do |child|
      child.value += value
      node_child_value_add(child, value)
    end
  end

  def node_max_collection(node)
    return @parent_collection if node.parent == nil
    @parent_collection << node.parent
    node = node.parent
    node_max_collection(node)
  end

  def node_search(base_node, node_identifier)
    return base_node if base_node.identifier == node_identifier

    base_node.children.each do |child|
      result = child.node_search(child, node_identifier)
      return result if result && (result.identifier == node_identifier)
    end
    return nil
  end

end
