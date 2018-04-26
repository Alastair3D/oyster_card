require 'station'

describe Station do
  let(:station) { Station.new(:bank, 1) }

  context 'A new instance of station' do
    it 'creates the new instance of station with a name' do
      expect(station.name).to eq :bank
    end
    it 'creates the new instance of station with a zone' do
      expect(station.zone).to eq 1
    end
  end
end
