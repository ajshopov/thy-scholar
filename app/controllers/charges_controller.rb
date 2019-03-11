class ChargesController < ApplicationController
  def new
  end

  def create
    # byebug
    @question = Question.find(params[:question_id])
    # Amount in cents
    @amount = 500

    # customer = Stripe::Customer.create({
    #   email: params[:stripeEmail],
    #   source: params[:stripeToken],
    # })

    charge = Stripe::Charge.create({
      amount: @amount,
      application_fee_amount: 100,
      description: 'Rails Stripe customer',
      currency: 'usd',
      source: params[:stripeToken]
      }, stripe_account: @question.recipient.stripe_id
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
