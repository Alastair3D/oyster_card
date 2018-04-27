class Journey

attr_reader :history, :journey

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

def start
  @complete = false
end

def end
  @complete = true
end

end
