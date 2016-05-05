require_relative 'node'

describe Node do

  describe '#initialize' do
    let(:node) {Node.new(1)}
    it 'creates a new node object with an identifier' do
      expect(node.identifier).to eq(1)
    end
  end

  describe 'clear_parent_collection' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    it 'clears a parent_collection associated with two nodes' do
      node.parent_collection << "dad"
      node_two.parent_collection << "mom"
      node.clear_parent_collection(node, node_two)
      expect(node.parent_collection).to eq([])
      expect(node_two.parent_collection).to eq([])
    end
  end

  describe 'add_child' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    it 'adds a child node to the current node children array' do
      node.add_child(node_two)
      expect(node.children).to eq([node_two])
    end
  end

  describe 'node_child_value_add' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    it 'changes the nodes childrens values' do
      node.add_child(node_two)
      node.node_child_value_add(node, 20)
      expect(node_two.value).to eq(20)
    end
  end

  describe 'node_max_collection' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    let(:node_three) {Node.new(3)}
    it 'returns a parent_collection of a given node' do
      node.add_child(node_two)
      expect(node_two.node_max_collection(node_two)).to eq([node])
    end
  end

  describe 'node_search' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    it 'finds a given node by the identifier' do
      node.add_child(node_two)
      expect(node.node_search(node, 2)).to eq(node_two)
    end
  end

end
