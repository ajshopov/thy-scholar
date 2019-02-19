class Question < ApplicationRecord
  validates :query, presence: true
  has_many :answers
  # belongs_to :user
end
