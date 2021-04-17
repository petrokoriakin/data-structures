# frozen_string_literal: true

module Structures
  # +DynamicArray+ holds data and doubles it's size when limit is reached
  class DynamicArray
    attr_reader :capacity, :size

    def initialize(initial_size = 16)
      raise "Illegal capacity: #{initial_size}" if initial_size.negative?

      @capacity = initial_size
      @size = 0
      @arr = Array.new(@capacity)
    end

    def empty?
      @size.zero?
    end

    def get(index)
      raise 'Out of Bounds' if index.negative? || index >= @size

      @arr[index]
    end

    def set(index, value = 0)
      raise 'Out of Bounds' if index.negative? || index >= @size

      @arr[index] = value
    end

    def clear!
      @size.times { |index| @arr[index] = nil }
      @size = 0
    end

    def add(value)
      if @size + 1 >= @capacity
        @capacity = extend_capacity(@capacity)
        new_arr = Array.new(@capacity)
        @size.times { |index| new_arr[index] = @arr[index] }
        @arr = new_arr
      end
      @arr[@size] = value
      @size += 1
      @arr
    end

    def extend_capacity(capacity)
      capacity.zero? ? 1 : capacity * 2
    end

    def remove_at(rm_index)
      raise 'Out of Bounds' if rm_index.negative? || rm_index >= @size

      item = get(rm_index)
      @arr = compose_new_container_without(rm_index, @arr, @capacity)
      @size -= 1
      item
    end

    def compose_new_container_without(rm_index, container, capacity)
      new_container = Array.new(capacity)
      new_index = 0
      capacity.times do |index|
        next if index == rm_index

        new_container[new_index] = container[index]
        new_index += 1
      end
      new_container
    end

    def remove(value)
      removed = false
      @size.times do |index|
        if @arr[index] == value
          remove_at(index)
          removed = true
        end
      end
      removed
    end

    def index_of(value)
      @size.times do |index|
        return index if @arr[index] == value
      end
      nil
    end

    def contains?(value)
      index_of(value) != nil
    end

    alias containing? contains?

    def to_string
      return '[]' if @size.zero?

      "[#{@arr.join(',')}]"
    end
  end
end
