class Answer < ApplicationRecord
  # belongs_to :user
  belongs_to :question
  validates :response, presence: true, length: { minimum: 10 }

  # scope :persisted, lambda { where.not(id: nil) }
end
