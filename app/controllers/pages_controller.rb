class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def faq
  end

  def search
    @questions = Question.order(updated_at: :desc)
    @lectures = Lecture.order(updated_at: :desc)

    @all_items = (@questions.to_a + @lectures.to_a).sort_by(&:updated_at).reverse
  end
end
