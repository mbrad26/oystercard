require 'oystercard.rb'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  it 'stores entry and exit stations' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end

  describe "#top_up" do
    it "can top up balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
   end

   describe "#in_journey?" do
     it "is initially not in a journey" do
       expect(subject).not_to be_in_journey
     end
   end

   describe "#touch_in" do
     before do
       subject.top_up(1)
       subject.touch_in(entry_station)
     end
     it "can touch in" do
       expect(subject).to be_in_journey
     end

     it 'stores the entry station' do
       expect(subject.entry_station).to eq entry_station
     end
   end

   context "when insufficient balance" do
     it "will not touch in" do
       expect { subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
     end
   end

   describe "#touch_out" do
     before do
       subject.top_up(5)
       subject.touch_in(entry_station)
       subject.touch_out(exit_station)
     end
     it "can touch out" do
       expect(subject).not_to be_in_journey
     end

     it 'stores exit stations' do
       expect(subject.exit_station).to eq exit_station
     end
   end

   context "when top up is required" do
     before do
       subject.top_up Oystercard::MAXIMUM_BALANCE
     end

     it 'has an upper limit' do
       error = "Maximum limit of #{Oystercard::MAXIMUM_BALANCE} reached!"
       expect { subject.top_up 1 }.to raise_error error
     end

     context 'when journey is complete' do
       it 'deducts the correct amount' do
         subject.touch_in(entry_station)
         expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by -Oystercard::MINIMUM_BALANCE
       end
     end
   end
end
