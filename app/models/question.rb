# frozen_string_literal: true

class Question < ApplicationRecord
  validates :query, presence: true
end
