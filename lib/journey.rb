class Journey

  attr_reader :history, :journey, :entry_station
  MINIMUM_FARE = 1

  def initialize
    @history = []
    @journey = {}
    @complete = true
  end

  def adds_journey
    @history << @journey
  end

  def complete?
    @complete
  end

  def start(entry_station)
    @complete = false
    @entry_station = entry_station
  end

  def end
    @complete = true
  end

  def fare
    MINIMUM_FARE
  end

end
