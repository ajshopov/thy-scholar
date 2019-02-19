FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@thyscholar.com" }
    password { 'password' }
  end
end
