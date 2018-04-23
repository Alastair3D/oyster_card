require 'oyster_card'

describe Oystercard do
  context 'A new oyster card' do
    it 'Has a default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
  context 'Any oyster card' do
    it 'Adds top up value to existing balance' do
      subject.top_up(50)
      expect(subject.balance).to eq 50
    end
    it 'Allows a maximum total balance of £90' do
      expect { subject.top_up(91) }.to raise_error(RuntimeError)
    end
    it 'Deducting fare amount from balance' do
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq 5
    end
  end
end
