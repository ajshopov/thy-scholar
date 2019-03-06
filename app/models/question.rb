class Question < ApplicationRecord
  validates :query, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  has_one :answer, :dependent => :destroy
end
