require 'rails_helper'
require 'stripe_mock'

# Examples from https://github.com/rebelidealist/stripe-ruby-mock

describe "credit card" do
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  it "creates a stripe customer" do

    # This doesn't touch stripe's servers nor the internet!
    # Specify :source in place of :card (with same value) to return customer with source data
    customer = Stripe::Customer.create({
      email: 'johnny@appleseed.com',
      source: stripe_helper.generate_card_token
    })
    expect(customer.email).to eq('johnny@appleseed.com')
  end

  it "mocks a declined card error" do
    # Prepares an error for the next create charge request
    StripeMock.prepare_card_error(:card_declined)

    expect { Stripe::Charge.create(amount: 1, currency: 'usd') }.to raise_error {|e|
      expect(e).to be_a Stripe::CardError
      expect(e.http_status).to eq(402)
      expect(e.code).to eq('card_declined')
    }
  end
end
