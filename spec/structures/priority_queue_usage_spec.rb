# frozen_string_literal: true

require 'structures/priority_queue'

RSpec.xdescribe Structures::PriorityQueue do
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

    it 'removes the element from the priority queue' do
      expect(priority_queue).not_to be_containing(13)
    end

    context 'when element with the lowest priority was polled from the queue' do
      before { priority_queue.poll }

      it 'returns the value of the next element with the lowest priority' do
        expect(priority_queue.poll).to eq(42)
      end
    end
  end

  it 'is defenitely healthy' do
    expect(Structures::Heap::Utils).to be_reporting_healthy(priority_queue)
  end
end
