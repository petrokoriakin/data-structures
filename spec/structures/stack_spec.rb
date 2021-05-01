# frozen_string_literal: true

require 'structures/stack'

RSpec.describe Structures::Stack do
  context 'when empty' do
    subject(:empty_stack) { described_class.new }

    it 'is empty' do
      expect(empty_stack).to be_empty
    end

    describe '#pop' do
      it 'raises an error' do
        expect { empty_stack.pop }.to raise_error('Empty Stack')
      end
    end

    describe '#peek' do
      it 'raises an error' do
        expect { empty_stack.peek }.to raise_error('Empty Stack')
      end
    end
  end

  context 'with elements' do
    subject(:stack) do
      list_stack = described_class.new
      list_stack.push(first_item)
      list_stack.push(last_item)
      list_stack
    end

    let(:first_item) { 13 }
    let(:last_item) { 69 }
    let(:another_item) { 42 }

    describe '#push' do
      it 'increases the size' do
        expect { stack.push(another_item) }.to change(stack, :size).from(2).to(3)
      end

      it 'returns updated size' do
        expect(stack.push(another_item)).to eq(3)
      end
    end

    describe '#pop' do
      it 'decreases the size' do
        expect { stack.pop }.to change(stack, :size).from(2).to(1)
      end

      it 'returns an item' do
        expect(stack.pop).to eq(last_item)
      end
    end

    describe '#peek' do
      it 'does nothing with size' do
        expect { stack.peek }.not_to change(stack, :size).from(2)
      end

      it 'returns an item' do
        expect(stack.peek).to eq(last_item)
      end
    end

    describe '#search' do
      it 'returns an index of element' do
        expect(stack.search(last_item)).to eq(1)
      end
    end
  end
end
