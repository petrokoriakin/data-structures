# frozen_string_literal: true

require 'structures/linked_list/node'

RSpec.describe Structures::LinkedList::Node do
  describe '#to_string' do
    subject(:node) { described_class.new(13, nil, nil) }

    it 'returns data string' do
      expect(node.to_string).to eq('13')
    end
  end
end
