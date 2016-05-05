require_relative 'node'

class Tree
  attr_reader :root

  def initialize(node)
    @root = node
  end

  def add(node_identifier, value)
    change_node = self.search(node_identifier)
    change_node.value += value
    change_node.node_child_value_add(change_node, value)
    change_node.value
  end

  def max(node_a, node_b)
    node_a = self.search(node_a)
    node_b = self.search(node_b)

    node_a_collection = node_a.node_max_collection(node_a)
    node_b_collection = node_b.node_max_collection(node_b)
    node_a_collection << node_a
    node_b_collection << node_b

    final_node = node_a_collection.concat(node_b_collection).sort_by {|node| node.value }.pop
    node_a.clear_parent_collection(node_a, node_b)
    return final_node.value
  end

  def search(node_identifier)
    @root.node_search(@root, node_identifier)
  end

end
