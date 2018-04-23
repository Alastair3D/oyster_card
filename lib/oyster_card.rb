class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise 'Sorry, total balance would exceed £90' if (@balance + number) >= 90
    @balance += number
  end
end
