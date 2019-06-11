module QuestionsHelper
  def has_answer(question)
    if !question.answer.nil?
      truncate(strip_tags(question.answer.response), length: 100,
        separator: ' '){ link_to "(read more)", question_path(question) }
    else
      "This question hasnt been answered yet."
    end
  end
end
