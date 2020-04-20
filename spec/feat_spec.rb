require './lib/oystercard'

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
card = Oystercard.new
card.top_up(90)
# card.deduct(10)

# In order to get through the barriers.
# As a customer
# I need to touch in and out.
card.in_journey?
# station = Station.new
# card.touch_in(station)

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.
card = Oystercard.new
#raise card.touch_in


# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card
# card = Oystercard.new
# card.top_up(10)
# card.touch_in
# card.touch_out
# card.balance = 9

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from
card = Oystercard.new
# station = Station.new
# card.touch_in(station)
