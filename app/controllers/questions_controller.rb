class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question has been created."
      redirect_to @question
    else
      flash.now[:alert] = "Question has not been created."
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:query)
  end
end
