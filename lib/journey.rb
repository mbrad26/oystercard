class Journey

PENALTY_FARE = 6

attr_reader :entry_station

  def initialize(entry_station = {})
    @entry_station = entry_station[:entry_station]

  end

  def complete?

  end

  def fare
    if @entry_station == "Old Street"
      1
    else
      PENALTY_FARE
    end
  end

  def finish(station)
    self
  end

end
