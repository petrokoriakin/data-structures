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

    def push(item); end

    def pop; end

    def peek; end

    def search; end
  end
end
