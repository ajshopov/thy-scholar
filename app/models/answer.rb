class Answer < ApplicationRecord
  # belongs_to :user
  belongs_to :question
  validates :response, presence: true
end
