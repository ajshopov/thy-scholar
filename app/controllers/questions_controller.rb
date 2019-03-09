class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @questions = Question.order(updated_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    if Answer.exists?(question_id: @question.id)
      @answer = Answer.where(question_id: @question.id)
    else
      @answer = @question.build_answer
    end
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    @question.sender = current_user
    @question.state = 'pending'

    if @question.save
      flash[:notice] = 'Question has been created.'
      redirect_to @question
    else
      flash.now[:alert] = 'Question has not been created.'
      render 'new'
    end
  end

  # def update
  #   @question = Question.find(params[:id])
  #   @question.update(question_params)

  #   flash[:notice] = 'Question has been updated.'
  #   redirect_to @question
  # end

  private

  def question_params
    params.require(:question).permit(:query, :recipient_id, :price)
  end
end
