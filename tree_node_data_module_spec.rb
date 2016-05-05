require_relative 'tree_node_data_module'
require_relative 'node'

describe TreeNodeDataGather do

  describe '#node_data_file_reader' do
    let(:file) {'input_easy.txt'}
    it 'takes in a txt file and converts parts into an array of numbers' do
      expect(TreeNodeDataGather.node_data_file_reader(file)).to eq([[1, 2], [1, 3], [3, 4], [3, 5], [5, 6], [5, 7], [7, 8], [7, 9], [9, 10], [9, 11], [11, 12], [11, 13], [13, 14], [13, 15], [15, 16], [15, 17], [17, 18], [17, 19], [19, 20], [19, 21], [21, 22], [21, 23], [23, 24], [23, 25], [25, 26], [25, 27], [27, 28], [27, 29], [29, 30], [29, 31], [31, 32], [31, 33], [33, 34], [33, 35], [35, 36], [35, 37], [37, 38], [37, 39], [39, 40], [39, 41], [41, 42], [41, 43], [43, 44], [43, 45], [45, 46], [45, 47], [47, 48], [47, 49], [49, 50], [49, 51], [51, 52], [51, 53], [53, 54], [53, 55], [55, 56], [55, 57], [57, 58], [57, 59], [59, 60], [59, 61], [61, 62], [61, 63], [63, 64], [63, 65], [65, 66], [65, 67], [67, 68], [67, 69], [69, 70], [69, 71], [71, 72], [71, 73], [73, 74], [73, 75], [75, 76], [75, 77], [77, 78], [77, 79], [79, 80], [79, 81], [81, 82], [81, 83], [83, 84], [83, 85], [85, 86], [85, 87], [87, 88], [87, 89], [89, 90], [89, 91], [91, 92], [91, 93], [93, 94], [93, 95], [95, 96], [95, 97], [97, 98], [97, 99]])
    end
  end

  describe '#method_data_file_reader' do
    let(:file) {'input_easy.txt'}
    it 'takes in a txt file and converts parts into an array of will be methods' do
      expect(TreeNodeDataGather.method_data_file_reader(file)).to eq([["add", 1, -3060], ["max", 53, 85], ["max", 8, 74], ["max", 15, 17], ["max", 30, 25], ["add", 6, -9836], ["max", 46, 26], ["add", 8, 3840], ["add", 9, 4939], ["max", 79, 53], ["add", 11, -746], ["add", 12, -5251], ["add", 13, 1925], ["add", 14, -7377], ["add", 15, 8652], ["add", 16, -7568], ["max", 23, 7], ["add", 18, -2422], ["add", 19, 7558], ["max", 67, 60], ["max", 17, 74], ["max", 83, 94], ["add", 23, 511], ["add", 24, 9877], ["max", 3, 25], ["add", 26, -4321], ["add", 27, 8965], ["max", 90, 40], ["add", 29, 5085], ["max", 58, 78], ["max", 21, 43], ["add", 32, -3730], ["add", 33, -3427], ["max", 15, 95], ["add", 35, -4035], ["max", 52, 15], ["max", 46, 17], ["max", 83, 26], ["add", 39, -2088], ["add", 40, 5981], ["max", 86, 93], ["max", 76, 61], ["max", 17, 53], ["add", 44, -5672], ["add", 45, -1563], ["max", 33, 3], ["max", 77, 71], ["max", 12, 84], ["max", 43, 86], ["max", 40, 53], ["add", 51, 5139], ["max", 9, 6], ["add", 53, -9339], ["add", 54, 4823], ["add", 55, 6060], ["add", 56, 4174], ["add", 57, 3031], ["max", 32, 67], ["add", 59, 6318], ["max", 55, 79], ["add", 61, -8036], ["add", 62, 1609], ["max", 12, 51], ["add", 64, -95], ["max", 6, 57], ["add", 66, 1444], ["add", 67, -2193], ["max", 26, 75], ["add", 69, 3374], ["max", 24, 49], ["max", 7, 62], ["add", 72, 8565], ["add", 73, -8424], ["add", 74, 7071], ["max", 88, 43], ["add", 76, -1213], ["add", 77, -9327], ["max", 38, 55], ["max", 81, 92], ["add", 80, -9303], ["add", 81, -4145], ["max", 41, 21], ["max", 7, 10], ["max", 36, 24], ["add", 85, -2316], ["add", 86, 971], ["add", 87, -1979], ["add", 88, -6106], ["max", 15, 54], ["max", 97, 11], ["max", 9, 14], ["add", 92, -4849], ["max", 74, 38], ["add", 94, -7497], ["add", 95, 4271], ["add", 96, 1909], ["add", 97, -9905], ["max", 16, 7], ["add", 99, -6406]])
    end
  end

  describe '#output_writer' do
    let(:file) {'test_rspec.txt'}
    let(:content) {[1, 2, 3]}
    it 'writes to a file' do
      TreeNodeDataGather.output_writer(file, content)
      expect(File.read(file)).to eq("1\n2\n3\n")
    end
  end

  describe '#node_maker' do
    let(:array) {[1]}
    it 'takes in an array and makes Node objects' do
      expect(TreeNodeDataGather.node_maker(array)[0]).to be_a(Node)
    end
  end

  describe '#node_child_maker' do
    let(:node) {Node.new(1)}
    let(:node_two) {Node.new(2)}
    let(:nodes_array) {[node, node_two]}
    let(:node_data) {[[1, 2]]}
    it 'adds children to a parent node' do
      TreeNodeDataGather.node_child_maker(nodes_array, node_data)
      expect(node.children).to include(node_two)
    end
  end


end
