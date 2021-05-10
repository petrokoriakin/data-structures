# frozen_string_literal: true

require 'structures/priority_queue'

RSpec.describe Structures::PriorityQueue do
  subject(:priority_queue) do
    pqueue = described_class.new
    pqueue.add(69)
    pqueue.add(13)
    pqueue.add(42)
    pqueue
  end

  describe '#poll' do
    it 'returns the value of the element with the lowest priority in this priority queue' do
      expect(priority_queue.poll).to eq(13)
    end

    context 'when element with the lowest priority was polled from the queue' do
      before { priority_queue.poll }

      it 'returns the value of the next element with the lowest priority' do
        expect(priority_queue.poll).to eq(42)
      end

      it 'removes the element from the priority queue' do
        expect(priority_queue).not_to be_containing(13)
      end
    end
  end

  describe '#add' do
    subject(:queue) do
      priority_queue.add(124)
      priority_queue.add(256)
      priority_queue.add(64)
      priority_queue.add(0)
      priority_queue
    end

    it 'keeps queue in healthy state' do
      expect(Structures::Heap::Utils).to be_reporting_healthy(queue)
    end

    it 'allows polling items' do
      expect(queue.poll).to eq(0)
    end
  end

  it 'is defenitely healthy' do
    expect(Structures::Heap::Utils).to be_reporting_healthy(priority_queue)
  end
end
