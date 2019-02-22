class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @question = @user.questions.build(user_id: @user.id)
  end
end
