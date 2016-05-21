require 'spec_helper'
require 'slot'

RSpec.describe Slot do
  describe '#value' do
    subject(:slot) { Slot.new }

    it 'has a empty string as a default value' do
      expect(slot.value).to eql(" ")
    end

    context 'when a value is set for the slot' do
      it 'can set a value' do
        slot.value = 'R'
        expect(slot.value).to eql('R')
      end
    end
  end
end