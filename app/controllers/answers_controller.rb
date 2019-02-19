class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = @question.build_answer(answer_params)

    if @answer.save
      flash[:notice] = 'Answer has been created.'
      redirect_to @question
    else
      flash.now[:alert] = 'Answer has not been created.'
      render 'questions/show'
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
