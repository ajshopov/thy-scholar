class ChargesController < ApplicationController
  def new
  end

  def create
    # byebug
    @question = Question.find(params[:question_id])
    @charge = Charge.create(question: @question)
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })

    token = Stripe::Token.create({
      :customer => customer.id,
    }, {:stripe_account => @question.recipient.stripe_id})

    # save customer.id to database?

    transaction = Stripe::Charge.create({
      amount: @amount,
      application_fee_amount: 100,
      currency: 'usd',
      source: token.id
      }, stripe_account: @question.recipient.stripe_id
    )
    # byebug
    if transaction.paid?
      @charge.paid = transaction.paid
      @charge.total = transaction.amount
      @charge.fee_charged = transaction.application_fee_amount
      @charge.stripe_charge_id = transaction.id
      @charge.save!
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
