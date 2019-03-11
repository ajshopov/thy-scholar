FactoryBot.define do
  factory :charge do
    question { nil }
    paid { false }
    total { "9.99" }
    fee_charged { "9.99" }
    string_charge_id { "MyString" }
  end
end
