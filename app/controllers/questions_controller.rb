# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
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
      flash[:notice] = 'Question has been created.'
      redirect_to @question
    else
      flash.now[:alert] = 'Question has not been created.'
      render 'new'
    end
  end

  def answering
    @question = Question.find(params[:id])
    @question.update(question_params)

    flash[:notice] = 'Answer has been created.'
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:query, :answer)
  end
end
