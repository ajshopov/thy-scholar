FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@thyscholar.com" }
    name { 'Big Al'}
    password { 'password' }
  end
end
