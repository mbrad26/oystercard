require 'oystercard.rb'

describe Oystercard do
  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'has an upper limit' do
      subject.top_up Oystercard::MAXIMUM_BALANCE
      error = "Maximum limit of #{Oystercard::MAXIMUM_BALANCE} reached!"

      expect { subject.top_up 1 }.to raise_error error
    end

    end
  end
