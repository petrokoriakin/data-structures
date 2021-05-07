# frozen_string_literal: true

require 'structures/heap/utils'
require 'structures/priority_queue'

RSpec.describe Structures::Heap::Utils do
  let(:healthy_heap_array) { [1, 2] }
  let(:unhealthy_heap_array) { [2, 1] }
  let(:healthy_heap_map) { { 1 => [0], 2 => [1] } }
  let(:unhealthy_heap_map) { { 1 => [0], 2 => [0] } }

  describe '#reporting_consistent_min_heap?' do
    it 'identifies healthy heap' do
      expect(described_class).to be_reporting_consistent_min_heap(healthy_heap_array)
    end

    it 'identifies unhealthy heap' do
      expect(described_class).not_to be_reporting_consistent_min_heap(unhealthy_heap_array)
    end
  end

  describe '#reporting_healthy?' do
    it 'returns true for empty queue' do
      queue = Structures::PriorityQueue.new
      expect(described_class).to be_reporting_healthy(queue)
    end
  end

  describe '#reporting_consistent_heap_map?' do
    it 'identifies healthy heap map' do
      expect(described_class).to be_reporting_consistent_heap_map(healthy_heap_map, healthy_heap_array)
    end

    it 'identifies unhealthy heap map' do
      expect(described_class).not_to be_reporting_consistent_heap_map(unhealthy_heap_map, healthy_heap_array)
    end
  end
end
