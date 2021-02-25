FactoryBot.define do
  factory :wallet do
    name { "main" }
    currency

    trait :invalid do
      name { nil }
    end
  end
end
