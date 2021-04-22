# frozen_string_literal: true

module Structures
  module LinkedList
    # +Structures::LinkedList::Node+ represents a node of doubly linked list
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

      def remove!
        @prev_node.next_node = @next_node
        @next_node.prev_node = @prev_node
        value = @data
        clear!
        value
      end

      def clear!
        @data = @next_node = @prev_node = nil
      end
    end
  end
end
