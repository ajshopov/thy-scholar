class AnswersController < ApplicationController
  before_action :set_question

  # def show
  #   @answer = Answer.find(params[:id])
  # end

  # def new
  #   @answer = Answer.new(question: @question)
  # end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      flash[:notice] = 'Answer has been created.'
      redirect_to @question
    else
      flash.now[:alert] = 'Answer has not been created.'
      redirect_to @question
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:response)
  end
end
