# frozen_string_literal: true

require 'structures/linked_list/node'

module Structures
  # +Structures::DoublyLinkedList+ represents a doubly linked list
  class DoublyLinkedList
    attr_accessor :size

    def initialize
      @size = 0
      @head = @tail = nil
    end

    def clear!
      trav = @head
      until trav.nil?
        next_node = trav.next_node
        trav.prev_node = trav.next_node = nil
        trav.data = nil
        trav = next_node
      end
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

      temp = @head
      (index - 1).times { temp = temp.next_node }
      new_node = Structures::LinkedList::Node.new(item, temp, temp.next_node)
      temp.next_node.prev_node = new_node
      temp.next_node = new_node
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
    def remove_first; end

    # Remove the last value at the tail of the linked list, O(1)
    def remove_last; end

    # Remove an arbitrary node from the linked list, O(1)
    def remove_node; end

    # Remove a node at a particular index, O(n)
    def remove_at; end

    # Remove a particular value in the linked list, O(n)
    def remove_value; end

    # Find the index of a particular value in the linked list, O(n)
    def index_of; end

    # Check is a value is contained within the linked list
    def contains?; end
    alias containing? contains?

    def to_string; end
  end
end
