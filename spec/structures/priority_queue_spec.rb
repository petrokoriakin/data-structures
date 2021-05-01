# frozen_string_literal: true

require 'structures/priority_queue'

RSpec.describe Structures::PriorityQueue do
  context 'when empty' do
    subject(:empty_queue) { described_class.new }

    it 'is empty' do
      expect(empty_queue).to be_empty
    end
  end
end
