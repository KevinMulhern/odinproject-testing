require 'slot'

RSpec.describe Slot do
  describe '#value' do
    subject(:slot) { Slot.new }

    it 'has a initial value of nil' do
      expect(slot.value).to be nil
    end

    context 'when a value is set for the slot' do

      it 'has a value of 7' do
        slot.value = 7
        expect(slot.value).to eql(7)
      end
    end
  end

end