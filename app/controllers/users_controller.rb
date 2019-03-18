class UsersController < ApplicationController
  def index
    @users = User.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @users = User.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def show
    @user = User.find(params[:id])
    @question = Question.new(recipient_id: @user.id)
  end
end
