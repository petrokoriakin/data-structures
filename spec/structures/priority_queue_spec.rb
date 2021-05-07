# frozen_string_literal: true

require 'structures/priority_queue'

RSpec.describe Structures::PriorityQueue do
  subject(:priority_queue) do
    queue = described_class.new
    queue.add(first_item)
    queue
  end

  let(:first_item) { 13 }

  describe '#containing?' do
    it 'returns true for existing element' do
      expect(priority_queue).to be_containing(first_item)
    end
  end

  describe '#remove_at' do
    it 'returns data' do
      expect(priority_queue.remove_at(0)).to eq(first_item)
    end

    it 'removes data from the queue' do
      priority_queue.remove_at(0)
      expect(priority_queue).not_to be_containing(first_item)
    end

    it 'keeps both heap and map heallthy' do
      priority_queue.remove_at(0)
      expect(Structures::Heap::Utils).to be_reporting_healthy(priority_queue)
    end
  end

  context 'when empty' do
    subject(:empty_queue) { described_class.new }

    it 'is empty' do
      expect(empty_queue).to be_empty
    end

    describe '#peek' do
      it 'returns nil' do
        expect(empty_queue.peek).to be_nil
      end
    end

    describe '#poll' do
      it 'raises Empty Queue error' do
        expect { empty_queue.poll }.to raise_error('Empty Queue')
      end
    end

    describe '#containing?' do
      it 'returns false for everything' do
        expect(empty_queue).not_to be_containing(13)
      end
    end

    describe '#remove_at' do
      it 'returns nil' do
        expect(empty_queue.remove_at(0)).to be_nil
      end
    end
  end
end
