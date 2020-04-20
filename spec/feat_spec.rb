require './lib/oystercard'

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
card = Oystercard.new
card.top_up(90)
card.deduct(10)
