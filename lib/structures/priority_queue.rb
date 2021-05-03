# frozen_string_literal: true

module Structures
  # +Structures::PriorityQueue+ represents a Queue
  class PriorityQueue
    def initialize
      @heap = []
      @map = {}
    end

    def empty?
      @heap.empty?
    end

    def size
      @heap.size
    end

    # Returns the value of the element with the lowest
    # priority in this priority queue. If the priority
    # queue is empty nil is returned.
    def peek
      return if empty?

      @heap.first
    end

    # Removes the root of the heap, O(log(n))
    def poll
      raise 'Empty Queue' if empty?
    end

    # Test if an element is in heap, O(1)
    def containing?(value); end

    # Adds an element to the priority queue, the
    # element must not be null, O(log(n))
    def add(value); end

    # Removes a particular element in the heap, O(log(n))
    def remove(item); end

    # Removes a node at particular index, O(log(n))
    def remove_at(index); end

    private

    # Perform bottom up node swim, O(log(n))
    def swim(node); end

    # Top down node sink, O(log(n))
    def sink(node); end

    # Swap two nodes. Assumes indexes are valid, O(1)
    def swap(first_index, second_index); end

    # Add a node value and its index to the map
    def map_add(value, index); end

    # Removes the index at a given value, O(log(n))
    def map_remove(value, index); end

    # Extract an index position for the given value
    # NOTE: If a value exists multiple times in the heap the highest
    # index is returned (this has arbitrarily been chosen)
    def map_get(value); end

    # Exchange the index of two nodes internally within the map
    def map_swap(first_value, second_value, first_index, second_index); end
  end
end
