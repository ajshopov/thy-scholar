class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :response, presence: true, length: { minimum: 10 }

  # scope :persisted, lambda { where.not(id: nil) }

  after_create :update_question_state

  private

  def update_question_state
    question.state = 'completed'
    question.save!
  end
end
