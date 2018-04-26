class Oystercard
  attr_reader :balance, :entry_station,:exit_station, :journey_list

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey = {}
    @history = []
  end

  def in_journey?
    @entry_station != nil
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
    @journey[:entry] = entry_station
  end

  def touch_out(exit_station)
    deduct
    @entry_station = nil
    @journey[:exit] = exit_station
    return @balance
  end

private

def deduct
  @balance -= 1
end


end
