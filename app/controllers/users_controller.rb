class UsersController < ApplicationController
  def index
    @experts = User.expert
    @customers = User.customer
  end

  def show
    @user = User.find(params[:id])
    @question = Question.new(recipient_id: @user.id)
  end
end
