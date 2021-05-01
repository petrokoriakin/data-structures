# frozen_string_literal: true

module Structures
  module Heap
    # +Structures::Heap::Utils+ provides a methods to keep heaps consistent
    module Utils
      # Recursively checks if this heap is a min heap
      # This method is just for testing purposes to make
      # sure the heap invariant is still being maintained
      # Called this method with k=0 to start at the root
      def self.reporting_consistent_min_heap?(heap_array); end

      def self.reporting_healthy?(priority_queue); end
    end
  end
end
