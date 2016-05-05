require_relative 'tree'
require_relative 'tree_node_data_module'

my_tree = Tree.new( TreeNodeDataGather.node_child_maker( TreeNodeDataGather.node_maker(TreeNodeDataGather.node_data_file_reader('input_easy.txt')), TreeNodeDataGather.node_data_file_reader('input_easy.txt') )[0] )
method_array = TreeNodeDataGather.method_data_file_reader('input_easy.txt')

content_array = []
method_array.each do |method_part|
  if method_part[0] == 'add'
    my_tree.send method_part[0], method_part[1], method_part[2]
  else
    content = my_tree.send method_part[0], method_part[1], method_part[2]
    content_array << content
  end
end

TreeNodeDataGather.output_writer('output_easy.txt', content_array)
