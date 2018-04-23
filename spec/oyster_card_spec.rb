require 'oyster_card'

describe Oystercard do
  context 'A new oyster card' do
    it 'Has a default balance of zero' do
      expect(subject.balance).to eq 0
    end
    it 'Has a default state of "not in journey"' do
      expect(subject.in_journey).to eq false
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
    # it 'Touches in user at journey start' do
    #   subject.touch_in
    #   expect(subject.in_journey?).to eq true
    # end
  end
end
