require 'caesar_cipher'

describe 'caesar_cipher' do
  subject{ caesar_cipher(string, shift) }
  let(:string) { 'kevin' }
  let(:shift) { 1 }

  context 'with a shit key of 1' do
    it "returns 'lfwjo'" do
      expect(subject).to eql('lfwjo')
    end

    context 'with punctuation' do
      let(:string) { 'kevin.'}

      it "returns 'lfwjo.'" do
        expect(subject).to eql('lfwjo.')
      end
    end

    context 'with the letter z' do
      let(:string) { 'z' }

      it 'returns a' do
        expect(subject).to eql('a')
      end
    end

    context 'with white space' do
      let(:string) {'aa bb'}

      it "returns 'bb cc'" do
        expect(subject).to eql('bb cc')
      end
    end
  end

  context 'with a shift key of 0' do
    let(:shift) { 0 }
    it "returns the same string" do
      expect(subject).to eql('kevin')
    end
  end

  context 'with a shift key of -1' do
    let(:shift) { -1 }
    it "returns 'jd'" do
      expect(subject).to eql('jduhm')
    end
  end

  context 'with a shift key of 10' do
    let(:shift) { 10 }

    it "returns 'uofsx'" do
      expect(subject).to eql('uofsx')
    end

  end
end