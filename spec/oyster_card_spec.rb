require 'oyster_card'

describe Oystercard do
  context 'A new oyster card' do
    it 'with a default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
end
