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
  end
end
