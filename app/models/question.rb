class Question < ApplicationRecord
  validates :query, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  has_one :answer, :dependent => :destroy
end
