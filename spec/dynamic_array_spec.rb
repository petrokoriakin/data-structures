# frozen_string_literal: true

require_relative '../dynamic_array'

RSpec.describe DynamicArray do
  it 'does smth' do
    expect(described_class.new).not_to be_nil
  end

  context 'when initialized' do
    context 'with negative initial size' do
      it 'raises an exception' do
        expect { described_class.new(-1) }.to raise_error('Illegal capacity: -1')
      end
    end
  end

  context 'when empty' do
    subject(:empty_array) { described_class.new(0) }

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

    describe '#is_empty?' do
      it 'returns true' do
        expect(empty_array.size).to be_truthy
      end
    end
  end
end
