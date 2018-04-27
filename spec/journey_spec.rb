require 'journey'
require 'pry'

describe Journey do
  let(:entry_station) { double :entry_station }

  describe '#history', :history do
    it 'Shows empty history array on initialization' do
      expect(subject.history).to eq []
    end
  end

  describe '#journey', :journey do
    it 'Shows empty journey hash on initialization' do
      expect(subject.journey).to be_empty
      end
    # it 'Tests elements in journey hash' do
    #   subject.complete?
    #   expect(subject.journey.length).to eq 2
    # end
  end

    describe '#complete?', :complete do
      it 'Shows status of complete?' do
        expect(subject.complete?).to eq true
      end
    end

  describe '#adds_journey', :adds_journey do
    it 'Adds journey to history' do
      subject.adds_journey
      expect(subject.history.length).to eq 1
    end
  end

  describe '#start', :start do
    it 'Changes complete? to false' do
      subject.start(entry_station)
      expect(subject.complete?).to eq false
    end

    it 'Checks that entry_station is defined upon start' do
      subject.start(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  describe '#end', :end do
    it 'Changes complete? to true' do
      subject.start(entry_station)
      subject.end
      expect(subject.complete?).to eq true
    end
  end

  describe '#fare', :fare do
    it 'Charges card either MINIMUM_FARE or PENALTY_FARE' do
      subject.start
      subject.end
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
  end

  describe '#fare', :fare do
    it 'Charge penalty when touch_in occurs twice in a row' do

    end
  end
end
