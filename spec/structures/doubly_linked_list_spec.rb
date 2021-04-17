# frozen_string_literal: true

require 'structures/doubly_linked_list'

RSpec.describe Structures::DoublyLinkedList do
  context 'when empty' do
    subject(:empty_list) { described_class.new }

    it 'is empty' do
      expect(empty_list).to be_empty
    end

    describe '#peek_first' do
      it 'raises an error' do
        expect { empty_list.peek_first }.to raise_error('Empty List')
      end
    end

    describe '#peek_last' do
      it 'raises an error' do
        expect { empty_list.peek_last }.to raise_error('Empty List')
      end
    end

    describe '#clear!' do
      it 'does nothing' do
        expect(empty_list.clear!).to eq(0)
      end
    end
  end

  context 'with one node' do
    subject(:single_node_list) do
      list = described_class.new
      list.add(some_data)
      list
    end

    let(:some_data) { 13 }

    it 'contains some data in a head' do
      expect(single_node_list.peek_first).to eq(some_data)
    end

    it 'contains some data in a tail' do
      expect(single_node_list.peek_last).to eq(some_data)
    end

    it 'returns its size' do
      expect(single_node_list.size).to eq(1)
    end

    describe '#clear!' do
      before { single_node_list.clear! }

      it 'zeroes the size' do
        expect(single_node_list.size).to eq(0)
      end

      it 'makes the list empty' do
        expect(single_node_list).to be_empty
      end
    end
  end

  context 'with reasonable nodes quantity' do
    subject(:linked_list) do
      list = described_class.new
      list.add(first_item)
      list.add(last_item)
      list
    end

    let(:first_item) { 13 }
    let(:last_item) { 69 }

    describe '#peek_first' do
      it 'returns first item' do
        expect(linked_list.peek_first).to eq(first_item)
      end
    end

    describe '#peek_last' do
      it 'returns last item' do
        expect(linked_list.peek_last).to eq(last_item)
      end
    end
  end
end
