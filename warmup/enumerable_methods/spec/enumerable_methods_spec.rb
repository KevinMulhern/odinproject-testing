require 'enumerable_methods'

describe Enumerable do
  describe '#my_each' do
    let(:my_each) { test_object.my_each { |item| item }}
    let(:test_object) { [1,2,3,4] }

    context 'when array has items' do
      it 'returns elements in the array' do
        expect(my_each).to eql([1,2,3,4])
      end
    end

    context 'when array is empty' do
      let(:test_object) { [] }

      it 'returns an empty array' do
        expect(my_each).to eql([])
      end
    end

    context 'when it is called on non enumerable object' do
      let(:test_object) { 99 }

      it 'raises a no method error' do
        expect{ my_each }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_each_with_index' do
    let(:my_each_with_index) {
      test_object.my_each_with_index do |item, index|
        index
      end
    }
    let(:test_object) { [1,2,3,4] }

    context 'when array has elements' do
      it 'returns the index and elements' do
        expect(my_each_with_index).to eql([1,2,3,4])
      end
    end

    context 'when array does not have elements' do
      let(:test_object) { [] }

      it 'returns an empty array' do
        expect(my_each_with_index).to eql([])
      end
    end

    context 'when object is non enumerable' do
      let(:test_object) { nil }

      it 'raises a no method error' do
        expect{ my_each_with_index }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_select' do
    let(:my_select) {
       test_object.my_select do |item|
         item > 2
       end
    }
    let(:test_object) { [1,2,3,4] }

    context 'when object has elements' do
      it 'will return new array' do
        expect(my_select).to eql([3,4])
      end
    end

    context 'when object has no items' do
      let(:test_object) { [] }

      it 'will return an empty object' do
        expect(my_select).to eql([])
      end
    end

    context 'when object is not an enumerable' do
      let(:test_object) { 99 }

      it 'will raise a no method error' do
        expect{ my_select }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_all?' do
    let(:my_all?) { test_object.my_all? { |item| item > 0 }  }
    let(:test_object) { [1,2,3,4] }

    context 'when object has elements' do

      context 'when all elements match condition' do
        it 'returns true' do
          expect(my_all?).to be true
        end
      end

      context 'when all elements do not match' do
        let(:test_object) { [0,1,2,3] }

        it 'returns false' do
          expect(my_all?).to be false
        end
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'returns true' do
        expect(my_all?).to be true
      end
    end

    context 'when object is not a enumerable' do
      let(:test_object) { 99 }

      it 'raise a no method error' do
        expect{ my_all? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_any?' do
    let(:my_any?) { test_object.my_any? { |item| item > 1 } }
    let(:test_object) { [1,2,3,4] }

    context 'when object has elements' do
      context 'when elements match condition' do
        it 'returns true' do
          expect(my_any?).to be true
        end
      end

      context 'when elements do not match condition' do
        let(:test_object) { [0,1] }

        it 'returns false' do
          expect(my_any?).to be false
        end
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'returns false' do
        expect(my_any?).to be false
      end
    end

    context 'when object is not a enumerable' do
      let(:test_object) { 99 }

      it 'raises a no method error' do
        expect{ my_any? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_none?' do
    let(:my_none?) { test_object.my_none? { |item| item > 4 } }
    let(:test_object) { [1,2,3,4] }

    context 'when object has elements' do

      context 'when elements match condition' do
        it 'returns true' do
          expect(my_none?).to be true
        end
      end

      context 'when elements do not match condition' do
        let(:test_object) { [1,2,5,6] }
        it 'returns false' do
          expect(my_none?).to be false
        end
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'returns true' do
        expect(my_none?).to be true
      end
    end

    context 'when object is not a enumerable object' do
      let(:test_object) { 99 }

      it 'raises a no method error' do
        expect{ my_none? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_count' do
    let(:my_count) { test_object.my_count { |item| item > 1} }
    let(:test_object) { [1,2,3,4] }

    context 'when obejct object some items' do
      context 'that match the condition' do
        it 'returns number of matched elements' do
          expect(my_count).to eql(3)
        end
      end

      context 'that do not match the condition' do
        let(:test_object) { [-1,0,1] }

        it 'returns 0' do
          expect(my_count).to eql(0)
        end
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'returns 0' do
        expect(my_count).to eql(0)
      end
    end

    context 'when object is not an enumerable object' do
      let(:test_object) { 99 }

      it 'will raise a no method error' do
        expect{ my_count }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_map' do
    let(:my_map) { test_object.my_map { |item| item * 2 } }
    let(:test_object) { [1,2,3,4] }

    context 'when object has elements' do
      it 'returns new object with modified elements' do
        expect(my_map).to eql([2,4,6,8])
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'returns an empty object' do
        expect(my_map).to eql([])
      end
    end

    context 'when object is not a enumerable object' do
      let(:test_object) { 99 }

      it 'will raise a no method error' do
        expect{ my_map }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_inject' do
    let(:my_inject) {
      test_object.my_inject { |sum,item| sum + item }
    }
    let(:test_object) { [1,2,3,4] }

    context 'when object has items' do
      context 'when no sum value is provided' do
        it 'will sum from the first element' do
          expect(my_inject).to eql(10)
        end
      end

      context 'when a sum of 10 is provided' do
        let(:my_inject) {
          test_object.my_inject(10) { |sum, item| sum + item }
        }

        it 'will sum from 10' do
          expect(my_inject).to eql(20)
        end
      end
    end

    context 'when object has no elements' do
      let(:test_object) { [] }

      it 'will return nil' do
        expect(my_inject).to be nil
      end

    end

    context 'when object is not a enumerable object' do
      let(:test_object) { 99 }

      it 'raises a no method error' do
        expect{ my_inject }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_map2' do
    let(:my_map_2) {
       test_object.my_map_2(my_proc) { |item| item + 1 }
     }
     let(:my_proc) { Proc.new { |item| item * 2 } }
     let(:test_object) { [1,2,3,4] }

     context 'when object has elements' do

       context 'when a proc and block is provided' do
         it 'returns a object with modified elements based on block and proc' do
           expect(my_map_2).to eql([4,6,8,10])
         end
       end

       context 'when just a proc is provided' do
         let(:my_map_2) {
           test_object.my_map_2(my_proc)
         }

         it 'returns a object with modified elements based on just the proc' do
           expect(my_map_2).to eql([2,4,6,8])
         end
       end

       context 'when no proc is provided' do
         let(:my_map_2) {
           test_object.my_map_2() { |item| item + 1 }
         }

         it 'returns a empty object' do
           expect(my_map_2).to eql([])
         end
       end
     end

     context 'when object does not have elements' do
       let(:test_object) { [] }

       it 'will return an empty object' do
         expect(my_map_2).to eql([])
       end
     end

     context 'when object is not a enumerable object' do
       let(:test_object) { 99 }

       it 'will raise a no method error' do
         expect{ my_map_2 }.to raise_error(NoMethodError)
       end
     end
  end
end