require 'oyster_card'
require 'pry'

describe Oystercard do
  let(:entry_station) { 'Parsons Green' }
  let(:exit_station) { 'Aldgate' }

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

    it 'Stores entry station' do
      subject.top_up(11)
      subject.touch_in(entry_station)
      expect(subject.journey[:entry]).to eq entry_station
    end

    it 'Deducts fare value of £1 from balance on touching out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.touch_out(exit_station)).to eq 9
    end

    it 'Stores exit location' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.history[0][:exit]).to eq exit_station
    end

    it 'Denies entry to station if balance is less than MINIMUM_BALANCE of £1' do
       expect { subject.touch_in(entry_station) }.to raise_error(RuntimeError)
    end

    it 'Checks new instances of Oystercard have an empty list of journeys by default' do
      expect(subject.history).to be_empty
    end

    it 'Checks touching in and then out creates one journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.history).not_to eq 0
    end
  end
end
