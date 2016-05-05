require_relative 'tree'
require_relative 'node'

describe Tree do

  describe '#initialize' do
    let(:node) {Node.new(1)}
    let(:tree) {Tree.new(node)}
    it 'creates a new tree with a root node' do
      expect(tree.root).to eq(node)
    end
  end

  describe 'add' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    let(:tree) {Tree.new(node)}
    it 'adds a value to a given node and that nodes children' do
      node.add_child(node_two)
      tree.add(1, 20)
      expect(node.value).to eq(20)
      expect(node_two.value).to eq(20)
    end
  end

  describe 'max' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    let(:node_three) {Node.new(3)}
    let(:tree) {Tree.new(node)}
    it 'returns the max value comparing two nodes and their parent branches' do
      node.add_child(node_two)
      node.add_child(node_three)
      node_two.value = 10
      node_three.value = 20
      expect(tree.max(2, 3)).to eq(20)
    end
  end

  describe 'search' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    let(:tree) {Tree.new(node)}
    it 'takes in a node identifier and returns that node' do
      node.add_child(node_two)
      expect(tree.search(1)).to eq(node)
      expect(tree.search(2)).to eq(node_two)
    end
  end

end
