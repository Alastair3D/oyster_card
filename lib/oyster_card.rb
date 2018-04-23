class Oystercard
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(number)
    raise "Sorry, #{balance + number} would exceed maximium of £90" if (@balance + number) >= 90
    @balance += number
  end

  def deduct(fare)
    @balance -= fare
  end
end
