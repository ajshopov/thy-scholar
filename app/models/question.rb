class Question < ApplicationRecord
  validates :query, presence: true
end
