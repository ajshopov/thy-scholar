class Question < ApplicationRecord
  validates :query, presence: true
  has_one :answer
  belongs_to :user
end
