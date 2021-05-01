# frozen_string_literal: true

require 'structures/queue'

RSpec.describe Structures::Queue do
  context 'when empty' do
    subject(:empty_queue) { described_class.new }

    it 'is empty' do
      expect(empty_queue).to be_empty
    end

    describe '#poll' do
      it 'raises an error' do
        expect { empty_queue.poll }.to raise_error('Empty queue')
      end
    end

    describe '#peek' do
      it 'raises an error' do
        expect { empty_queue.peek }.to raise_error('Empty queue')
      end
    end
  end

  context 'with elements' do
    subject(:queue) do
      list_queue = described_class.new
      list_queue.offer(first_item)
      list_queue.offer(last_item)
      list_queue
    end

    let(:first_item) { 13 }
    let(:last_item) { 69 }
    let(:another_item) { 42 }

    describe '#offer' do
      it 'increases the size' do
        expect { queue.offer(another_item) }.to change(queue, :size).from(2).to(3)
      end

      it 'returns updated size' do
        expect(queue.offer(another_item)).to eq(3)
      end
    end

    describe '#poll' do
      it 'decreases the size' do
        expect { queue.poll }.to change(queue, :size).from(2).to(1)
      end

      it 'returns an item' do
        expect(queue.poll).to eq(first_item)
      end
    end

    describe '#peek' do
      it 'does nothing with size' do
        expect { queue.peek }.not_to change(queue, :size).from(2)
      end

      it 'returns an item' do
        expect(queue.peek).to eq(first_item)
      end
    end

    describe '#search' do
      it 'returns an index of element' do
        expect(queue.search(last_item)).to eq(1)
      end
    end
  end
end
