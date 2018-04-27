require 'journey'
require 'pry'

describe Journey do

describe '#history', :history do
  it 'Shows empty history array on initialization' do
    expect(subject.history).to eq []
    end
  end
end
