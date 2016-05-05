require_relative 'node'

module TreeNodeDataGather

  def self.node_data_file_reader(file)
    string_pair_array = []
    number_array = []
    File.open(file, 'r').each do |f|
      unless f.match('add') || f.match('max')
        string_pair_array << f.slice(/(\d+)(\s)(\d+)/)
      end
    end
    string_pair_array.compact.each do |element|
      number_array << [element.match(/(\d+)(\s)(\d+)/)[1].to_s.to_i, element.match(/(\d+)(\s)(\d+)/)[3].to_s.to_i].sort
    end
    return number_array
  end

  def self.method_data_file_reader(file)
    method_storage_array = []
    File.open(file, 'r').each do |f|
      if f.match('add') || f.match('max')
        method_storage_array << [f.match(/([a-z]*)(\s)(.\d+|\d+)(\s)(.\d+|\d+)/)[1].to_s, f.match(/([a-z]*)(\s)(.\d+|\d+)(\s)(.\d+|\d+)/)[3].to_i, f.match(/([a-z]*)(\s)(.\d+|\d+)(\s)(.\d+|\d+)/)[5].to_i]
      end
    end
    return method_storage_array
  end

  def self.output_writer(file, content)
    File.open(file, 'w') do |f|
      f.puts content
    end
  end

  def self.node_maker(array)
    all_nodes = []
    uniq_array = array.flatten.uniq
    uniq_array.each do |num|
      all_nodes << Node.new(num)
    end
    return all_nodes
  end

  def self.node_child_maker(nodes, node_data)
    nodes.each do |node|
      node_data.each do |pair|
        if node.identifier == pair[0]
          nodes.each do |x_node|
            if x_node.identifier == pair[1]
              node.add_child(x_node)
            end
          end
        end
      end
    end
  end

end
