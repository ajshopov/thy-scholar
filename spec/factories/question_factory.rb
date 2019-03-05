# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    query { 'Example question' }
    price { 10 }
  end
end
