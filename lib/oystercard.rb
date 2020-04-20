class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum limit of #{MAXIMUM_BALANCE} reached!" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @in_use = true
  end

  def touch_out
    @in_use = false
    deduct(MINIMUM_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
