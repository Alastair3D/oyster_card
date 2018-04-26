class Oystercard
  attr_reader :balance, :entry_station,:exit_station, :journey, :history

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey = {}
    @history = []
  end

  def in_journey?
    !@journey
  end

  def top_up(number)
    raise "Sorry, £#{balance + number} would exceed maximium of £90" if (@balance + number) >= MAXIMUM_BALANCE
    @balance += number
  end

  def sufficient_entry_balance
    balance > 1
  end

  def touch_in(entry_station)
    raise "Sorry, balance insufficient" if @balance < MINIMUM_BALANCE
    adds_journey if in_journey?

    @journey[:entry] = entry_station
  end

  def touch_out(exit_station)
    deduct
    @entry_station = nil
    @journey[:exit] = exit_station
    @history << @journey
    adds_journey
    return @balance
  end

  def adds_journey
    @history << @journey
    @journey = nil
private

def deduct
  @balance -= 1
end

end
