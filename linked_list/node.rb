class Node
  attr_accessor :data, :prev_node, :next_node

  def initialize(data, prev_node, next_node)
    @data = data
    @prev_node = prev_node
    @next_node = next_node
  end

  def to_s
    data.to_s
  end
end
