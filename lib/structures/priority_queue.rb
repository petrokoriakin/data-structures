# frozen_string_literal: true

module Structures
  # +Structures::PriorityQueue+ represents a Queue
  class PriorityQueue
    def initialize
      @heap = []
      @map = Hash.new([])
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

      remove_at(0)
    end

    # Test if an element is in heap, O(1)
    def containing?(value)
      !@map[value].empty?
    end

    # Adds an element to the priority queue, the
    # element must not be null, O(log(n))
    def add(value)
      @heap << value
      map_add(value, last_index)
      swim(last_index)
    end

    # Removes a particular element in the heap, O(log(n))
    def remove(value)
      remove_at(map_get(value))
    end

    # Removes a node at particular index, O(log(n))
    def remove_at(index)
      return if empty?

      swap(index, last_index)
      removed_value = @heap.pop
      map_remove(removed_value, last_index + 1)
      return removed_value if index >= last_index

      swapped_value = @heap[index]
      swim(index)
      sink(index) if @heap[index] == swapped_value
      removed_value
    end

    private

    def last_index
      @heap.size - 1
    end

    # Perform bottom up node swim, O(log(n))
    def swim(index)
      parent_index = (index - 1) / 2
      while index.positive? && @heap[index] < @heap[parent_index]
        swap(parent_index, index)
        index = parent_index
        parent_index = (index - 1) / 2
      end
    end

    # Top down node sink, O(log(n))
    def sink(index)
      loop do
        left_child_index = 2 * index + 1
        right_child_index = 2 * index + 2
        smallest = left_child_index
        smallest = right if right_child_index < @heap.size && @heap[right_child_index] < @heap[left_child_index]
        break if left_child_index >= @heap.size || @heap[index] < @heap[smallest]

        swap(smallest, index)
        index = smallest
      end
    end

    # Swap two nodes. Assumes indexes are valid, O(1)
    def swap(first_index, second_index)
      @heap[first_index], @heap[second_index] = @heap.values_at(second_index, first_index)
      map_swap(@heap[second_index], @heap[first_index], first_index, second_index)
    end

    # Add a node value and its index to the map
    def map_add(value, index)
      @map[value] |= [index]
    end

    # Removes the index at a given value, O(log(n))
    def map_remove(value, index)
      @map[value] -= [index]
      @map.delete(value) if @map[value].empty?
    end

    # Extract an index position for the given value
    # NOTE: If a value exists multiple times in the heap the highest
    # index is returned (this has arbitrarily been chosen)
    def map_get(value)
      @map[value].max
    end

    # Exchange the index of two nodes internally within the map
    def map_swap(first_value, second_value, first_index, second_index)
      @map[first_value] -= [first_index]
      @map[second_value] -= [second_index]

      @map[first_value] |= [second_index]
      @map[second_value] |= [first_index]
    end
  end
end
