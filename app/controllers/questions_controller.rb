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
      # nothing yet
    end
  end

  private

  def question_params
    params.require(:question).permit(:expert, :question)
  end
end
