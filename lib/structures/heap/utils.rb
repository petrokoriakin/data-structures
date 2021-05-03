# frozen_string_literal: true

module Structures
  module Heap
    # +Structures::Heap::Utils+ provides a methods to keep heaps consistent
    module Utils
      # Recursively checks if this heap is a min heap
      # This method is just for testing purposes to make
      # sure the heap invariant is still being maintained
      # Called this method with k=0 to start at the root
      def self.reporting_consistent_min_heap?(heap_array, node_index = 0)
        return true if node_index >= heap_array.size

        left_child_index = 2 * node_index + 1
        right_child_index = 2 * node_index + 2

        return false if consistent_child_node?(heap_array, node_index, left_child_index)
        return false if consistent_child_node?(heap_array, node_index, right_child_index)

        reporting_consistent_min_heap?(heap_array, left_child_index) &&
          reporting_consistent_min_heap?(heap_array, right_child_index)
      end

      def self.consistent_child_node?(heap_array, node_index, child_index)
        child_index < heap_array.size && heap_array[node_index] > heap_array[child_index]
      end

      def self.reporting_healthy?(priority_queue)
        heap_array = priority_queue.instance_variable_get(:@heap)
        reporting_consistent_min_heap?(heap_array)
      end
    end
  end
end
