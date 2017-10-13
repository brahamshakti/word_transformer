require_relative './node'

class Graph
  attr_accessor :nodes
 
  def initialize
    @nodes = []
  end
  
  def add_node(name)
    Node.new(name)
  end

  def add_nodes(names)
    names.each do |name|
      @nodes << add_node(name)
    end
  end
  
  def add_edge(start_node, end_node)
    from = nodes[nodes.index { |node| node.name == start_node }]
    to   = nodes[nodes.index { |node| node.name == end_node }]
    from.neighbors << to
  end
  
  def get_node(node_name)
    nodes.select{|node| node.name==node_name}.first
  end
end