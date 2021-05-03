# frozen_string_literal: true

require 'structures/priority_queue'

RSpec.describe Structures::PriorityQueue do
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
  end
end
