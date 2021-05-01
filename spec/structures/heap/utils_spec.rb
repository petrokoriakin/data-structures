# frozen_string_literal: true

require 'structures/heap/utils'

RSpec.describe Structures::Heap::Utils do
  let(:healthy_heap_array) { [1, 2] }
  let(:unhealthy_heap_array) { [2, 1] }

  xdescribe '#consistent_min_heap?' do
    it 'identifies healthy heap' do
      expect(described_class).to be_reporting_consistent_min_heap(healthy_heap_array)
    end

    it 'identifies unhealthy heap' do
      expect(described_class).not_to be_reporting_consistent_min_heap(unhealthy_heap_array)
    end
  end
end
