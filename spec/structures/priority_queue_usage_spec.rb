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

  it 'returns minimal element' do
    expect(priority_queue.poll).to eq(13)
  end

  it 'returns second minimal element' do
    priority_queue.poll
    expect(priority_queue.poll).to eq(42)
  end

  it 'is defenitely healthy' do
    expect(Structures::Heap::Utils).to be_reporting_healthy(priority_queue)
  end
end
