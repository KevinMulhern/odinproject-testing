require 'spec_helper'
require 'column'

RSpec.describe Column do
  subject(:column) { Column.new(position, board) }
  let(:position) { 2 }
  let(:board) {
    [
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
      [slot, slot, slot, slot, slot, slot, slot],
    ]
   }
  let(:slot) { double('Slot') }

  describe '#new' do
    it 'initializes a new object' do
      expect(column).to be_an_instance_of(Column)
    end
  end

  describe '#build' do
    let(:expected_column) {
      [ slot, slot, slot, slot, slot, slot ]
    }

    it 'returns a column based on the position' do
      expect(column.build).to eql(expected_column)
    end
  end
end