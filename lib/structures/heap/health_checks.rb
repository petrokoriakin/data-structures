# frozen_string_literal: true

module Structures
  module Heap
    # +Structures::Heap::HealthChecks+ provides a methods to keep heaps consistent
    module HealthChecks
      # Recursively checks if this heap is a min heap
      # This method is just for testing purposes to make
      # sure the heap invariant is still being maintained
      # Called this method with k=0 to start at the root
      def consistent_min_heap?(heap_array, node_index = 0)
        return true if node_index >= heap_array.size

        left_child_index = 2 * node_index + 1
        right_child_index = 2 * node_index + 2

        return false if consistent_child_node?(heap_array, node_index, left_child_index)
        return false if consistent_child_node?(heap_array, node_index, right_child_index)

        consistent_min_heap?(heap_array, left_child_index) && consistent_min_heap?(heap_array, right_child_index)
      end

      def consistent_child_node?(heap_array, node_index, child_index)
        child_index < heap_array.size && heap_array[node_index] > heap_array[child_index]
      end

      def consistent_heap_map?(map, heap)
        return true if heap.empty? && (map.empty? || map.values.map(&:empty?).uniq == [true])

        map.keys.difference(heap).empty? && map.values.flatten.max == heap.size - 1
      end

      def healthy?
        heap_array = @heap
        heap_map = @map
        reporting_consistent_min_heap?(heap_array) && reporting_consistent_heap_map?(heap_map, heap_array)
      end
    end
  end
end
