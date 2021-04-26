# frozen_string_literal: true

require 'structures/linked_list/node'

module Structures
  # +Structures::DoublyLinkedList+ represents a doubly linked list
  class DoublyLinkedList
    include Enumerable

    attr_accessor :size, :head, :tail

    def initialize
      @size = 0
      @head = @tail = nil
    end

    def each
      trav = @head
      until trav.nil?
        yield trav
        trav = trav.next_node
      end
    end

    def clear!
      each(&:clear!)
      @head = @tail = nil
      @size = 0
    end

    def empty?
      @size.zero?
    end

    def add(item)
      add_last(item)
    end

    def add_last(item)
      if empty?
        @head = @tail = Structures::LinkedList::Node.new(item, nil, nil)
      else
        @tail.next_node = Structures::LinkedList::Node.new(item, @tail, nil)
        @tail = @tail.next_node
      end
      @size += 1
    end

    def add_first(item)
      if empty?
        @head = @tail = Structures::LinkedList::Node.new(item, nil, nil)
      else
        @head.prev_node = Structures::LinkedList::Node.new(item, nil, @head)
        @head = @head.prev_node
      end
      @size += 1
    end

    def add_at(index, item = nil)
      raise 'Illegal index' if index.negative? || index > @size

      return add_first(item) if index.zero?
      return add_last(item) if index == @size

      Structures::LinkedList::Node.insert_right_after(item, find_node_at(index - 1))
      @size += 1
    end

    def peek_first
      raise 'Empty List' if empty?

      @head.data
    end

    def peek_last
      raise 'Empty List' if empty?

      @tail.data
    end

    # Remove the first value at the head of the linked list, O(1)
    def remove_first
      raise 'Empty List' if empty?

      item = @head
      @head = item.next_node
      @head.prev_node = nil if @head
      @size -= 1
      item.data
    end

    # Remove the last value at the tail of the linked list, O(1)
    def remove_last
      raise 'Empty List' if empty?

      item = @tail
      @tail = item.prev_node
      @tail.next_node = nil if @tail
      @size -= 1
      item.data
    end

    # Remove an arbitrary node from the linked list, O(1)
    def remove_node(node)
      return if node.nil?
      return remove_first if node.prev_node.nil?
      return remove_last if node.next_node.nil?

      @size -= 1
      node.remove!
    end

    # Remove a node at a particular index, O(n)
    def remove_at(index)
      remove_node(find_node_at(index))
    end

    # Remove a particular value in the linked list, O(n)
    def remove_value(value)
      remove_node(find { |node| node.data == value })
    end

    # Find the index of a particular value in the linked list, O(n)
    def index_of(value)
      find_index { |node| node.data == value } || -1
    end

    # Check is a value is contained within the linked list
    def containing?(value)
      index_of(value) != -1
    end

    def to_string
      "[#{map(&:data).join(', ')}]"
    end

    private

    def find_node_at(target_index)
      each_with_index { |node, index| return node if index == target_index }
      nil
    end
  end
end
