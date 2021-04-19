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

    describe '#add_first' do
      let(:new_item) { 42 }

      before { empty_list.add_first(new_item) }

      it 'adds an item to the head' do
        expect(empty_list.peek_first).to eq(new_item)
      end

      it 'adds an item to the tails at the same time' do
        expect(empty_list.peek_last).to eq(new_item)
      end
    end

    describe '#peek_last' do
      it 'raises an error' do
        expect { empty_list.peek_last }.to raise_error('Empty List')
      end
    end

    describe '#remove_first' do
      xit 'raises an error' do
        expect { empty_list.remove_first }.to raise_error('Empty List')
      end
    end

    describe '#remove_last' do
      xit 'raises an error' do
        expect { empty_list.remove_last }.to raise_error('Empty List')
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

    xdescribe '#remove_first' do
      before { single_node_list.remove_first }

      it 'zeroes the size' do
        expect(single_node_list.size).to eq(0)
      end

      it 'makes the list empty' do
        expect(single_node_list).to be_empty
      end
    end

    xdescribe '#remove_last' do
      before { single_node_list.remove_last }

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
    let(:new_item) { 42 }

    describe '#add_at' do
      it 'raises an error for negative index' do
        expect { linked_list.add_at(-1) }.to raise_error('Illegal index')
      end

      it 'raises an error for overwhelming index' do
        expect { linked_list.add_at(3) }.to raise_error('Illegal index')
      end

      it 'adds an item to the head' do
        linked_list.add_at(0, new_item)
        expect(linked_list.peek_first).to eq(new_item)
      end

      it 'adds an item to the tail' do
        linked_list.add_at(linked_list.size, new_item)
        expect(linked_list.peek_last).to eq(new_item)
      end

      it 'increases size' do
        linked_list.add_at(1, new_item)
        expect(linked_list.size).to eq(3)
      end

      it 'returns size' do
        expect(linked_list.add_at(1, new_item)).to eq(3)
      end
    end

    describe '#add_first' do
      it 'adds an item to the head' do
        linked_list.add_first(new_item)
        expect(linked_list.peek_first).to eq(new_item)
      end
    end

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
