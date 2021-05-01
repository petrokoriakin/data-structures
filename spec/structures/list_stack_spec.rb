# frozen_string_literal: true

require 'structures/list_stack'

RSpec.describe Structures::ListStack do
  context 'when empty' do
    subject(:empty_stack) { described_class.new }

    it 'is empty' do
      expect(empty_stack).to be_empty
    end
  end
end
