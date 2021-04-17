# frozen_string_literal: true

require 'structures/dynamic_array'

RSpec.shared_examples 'index boundaries guard' do |current_method|
  describe 'with negative index' do
    it 'raises an exception' do
      expect { subject.send(current_method, -1) }.to raise_error('Out of Bounds')
    end
  end

  describe 'with out-of-bounds index' do
    it 'raises an exception' do
      expect { subject.send(current_method, 18) }.to raise_error('Out of Bounds')
    end
  end
end

RSpec.describe Structures::DynamicArray do
  context 'when initialized' do
    context 'with negative initial size' do
      it 'raises an exception' do
        expect { described_class.new(-1) }.to raise_error('Illegal capacity: -1')
      end
    end
  end

  context 'when empty' do
    subject(:empty_array) { described_class.new(0) }

    it 'can handle new element' do
      empty_array.add(-12)
      expect(empty_array.capacity).to eq(1)
    end

    describe '#to_string' do
      it 'returns square braces' do
        expect(empty_array.to_string).to eq('[]')
      end
    end

    describe '#size' do
      it 'returns 0' do
        expect(empty_array.size).to be_zero
      end
    end

    describe '#empty?' do
      it 'returns true' do
        expect(empty_array).to be_empty
      end
    end
  end

  context 'when limit is reached' do
    subject(:collection) do
      array = described_class.new(2)
      array.add(13)
      array
    end

    before { collection.add(69) }

    it 'holds first element' do
      expect(collection.get(0)).to eq(13)
    end

    it 'holds last element' do
      expect(collection.get(1)).to eq(69)
    end

    it 'doubles the capacity' do
      expect(collection.capacity).to eq(4)
    end

    it 'returns size' do
      expect(collection.size).to eq(2)
    end
  end

  describe 'within reasonable limits' do
    subject(:collection) do
      array = described_class.new(4)
      array.add(13)
      array.add(69)
      array
    end

    describe '#remove' do
      it 'removes an element by value' do
        collection.remove(69)
        expect(collection).not_to be_containing(69)
      end
    end

    describe '#index_of' do
      it 'returns the index of item' do
        expect(collection.index_of(69)).to eq(1)
      end

      it 'returns nil when there is no such item' do
        expect(collection.index_of(33)).to be_nil
      end
    end

    describe '#set' do
      it_behaves_like 'index boundaries guard', :set

      it 'sets an element by given index' do
        collection.set(0, 21)
        expect(collection.get(0)).to eq(21)
      end
    end

    describe '#get' do
      it_behaves_like 'index boundaries guard', :get
    end

    describe '#clear!' do
      it 'sets size to zero' do
        collection.clear!
        expect(collection.size).to eq(0)
      end
    end

    describe '#to_string' do
      it 'prints first item' do
        expect(collection.to_string).to include('13')
      end

      it 'prints last item' do
        expect(collection.to_string).to include('69')
      end
    end

    describe '#remove_at' do
      before { collection.remove_at(0) }

      it_behaves_like 'index boundaries guard', :remove_at

      it 'removes item' do
        expect(collection.get(0)).not_to eq(13)
      end

      it 'does nothing with capacity' do
        expect(collection.capacity).to eq(4)
      end

      it 'returns size' do
        expect(collection.size).to eq(1)
      end
    end
  end
end
