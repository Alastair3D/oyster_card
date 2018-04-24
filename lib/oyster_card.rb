class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def in_journey?
    @in_journey
  end

  def top_up(number)
    raise "Sorry, £#{balance + number} would exceed maximium of £90" if (@balance + number) >= MAXIMUM_BALANCE
    @balance += number
  end

  def sufficient_entry_balance
    balance > 1
  end

  def touch_in(station)
    raise "Sorry, balance insufficient" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct
    @in_journey = false
    return @balance
  end

private

def deduct
  @balance -= 1
end


end
