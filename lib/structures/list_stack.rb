# frozen_string_literal: true

require 'structures/doubly_linked_list'

module Structures
  # +Structures::ListStack+ represents a stack
  class ListStack
    def initialize
      @list = Structures::DoublyLinkedList.new
    end

    def empty?
      @list.empty?
    end

    def push(item)
      @list.add_last(item)
    end

    def pop
      raise 'Empty Stack' if empty?

      @list.remove_last
    end

    def peek
      raise 'Empty Stack' if empty?

      @list.peek_last
    end

    def search(item)
      @list.index_of(item)
    end

    def size
      @list.size
    end
  end
end
