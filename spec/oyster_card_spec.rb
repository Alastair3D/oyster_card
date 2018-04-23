require 'oyster_card'

describe Oystercard do
  context 'A new oyster card' do
    it 'Has a default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
  context 'An oyster card' do
    it 'Adds top up value to existing balance' do
      subject.top_up(50)
      expect(subject.balance).to eq 50
    end
  end
end
