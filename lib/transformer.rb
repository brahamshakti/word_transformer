require_relative 'graph'

class Transformer < Graph
  
  def initialize(words)
    super()
    @word_nodes = add_nodes(words)
  end

  def is_diff_one?(str1, str2)
    return false if(str1.size != str2.size)
    count = 0
    for i in 0...str1.size
      if(str1[i]!=str2[i])
        count = count+1
        return false if(count > 1)
      end
    end
    return true if(count==1)
    return false
  end
  
  def add_unidirectional_edges()
    for i in 0...@word_nodes.size
      for j in i...@word_nodes.size
        if is_diff_one?(@word_nodes[i], @word_nodes[j])
          add_edge(@word_nodes[i], @word_nodes[j])
        end
      end
    end
  end
  
  def find_first_node(start_node_name)
    for i in 0...@word_nodes.size
      if is_diff_one?(@word_nodes[i], start_node_name)
        return @word_nodes[i]
      end
    end
  end
  
  def bfs(start_node_name, end_node_name)
    visited = []
    level = {}
    queue = Queue.new
    start_node = get_node(find_first_node(start_node_name))
    return 0 unless start_node
    level[start_node]=1
    queue.enq(start_node)
    end_node = get_node(end_node_name)
    while(queue.size > 0)
      current_node = queue.pop
      if(current_node == end_node)
        return level[current_node]+1
      end
      current_node.neighbors.each do |neighbor|
        unless(visited.include?(neighbor))
          level[neighbor]=level[current_node]+1
          visited << neighbor
          queue.enq(neighbor)
        end
      end
    end
  end
end