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

      def self.insert_right_after(data, target)
        new_node = new(data, target, target.next_node)
        target.next_node.prev_node = new_node
        target.next_node = new_node
      end

      def to_string
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
