# frozen_string_literal: true

require 'structures/doubly_linked_list'

module Structures
  # +Structures::Queue+ represents a Queue
  class Queue
    def initialize
      @list = Structures::DoublyLinkedList.new
    end

    def empty?
      @list.empty?
    end

    def offer(item)
      @list.add_last(item)
    end

    def poll
      raise 'Empty Queue' if empty?

      @list.remove_first
    end

    def peek
      raise 'Empty Queue' if empty?

      @list.peek_first
    end

    def search(item)
      @list.index_of(item)
    end

    def size
      @list.size
    end
  end
end
