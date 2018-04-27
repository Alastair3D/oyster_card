require 'journey'
require 'pry'

describe Journey do

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
    subject.start
    expect(subject.complete?).to eq false
  end
end

describe '#end', :end do
  it 'Changes complete? to true' do
    subject.start
    subject.end
    expect(subject.complete?).to eq true
    end
end

end
