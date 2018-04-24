require 'oyster_card'

describe Oystercard do
  let(:station) { double :station }

  context 'A new oyster card' do
    it 'Has a default balance of zero' do
      expect(subject.balance).to eq 0
    end
    it 'Has a default state of "not in journey"' do
      expect(subject.in_journey?).to eq false
    end
  end
  context 'Any oyster card' do
    it 'Adds top up value to existing balance' do
      subject.top_up(50)
      expect(subject.balance).to eq 50
    end
    it 'Allows a MAXIMUM_BALANCE of £90' do
      expect { subject.top_up(91) }.to raise_error(RuntimeError)
    end
    # it 'Deducting fare amount from balance' do
    #   subject.top_up(10)
    #   subject.deduct
    #   expect(subject.balance).to eq 9
    # end
    it 'Touches a user in at journey start' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
    it 'Stores entry station' do
      subject.top_up(11)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it 'Deducts fare value of £1 from balance on touching out' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.touch_out).to eq 9
    end
    it 'Touches a user out at journey end' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
    it 'Denies entry to station if balance is less than MINIMUM_BALANCE of £1' do
       expect { subject.touch_in(station) }.to raise_error(RuntimeError)
    end


  end
end
