FactoryBot.define do
  factory :currency do
    name { "USD" }
    code { 840 }
    trait :invalid do
      name { nil }
      code { nil }
    end
  end
end
