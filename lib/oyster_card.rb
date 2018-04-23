class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(number)
    raise "Sorry, #{balance + number} would exceed maximium of £90" if (@balance + number) >= 90
    @balance += number
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end

oyster = Oystercard.new
p oyster.in_journey?
