FactoryBot.define do
  factory :cash_flow do
    transact_type { "profit" }
    currency
    wallet

    trait :invalid do
      transact_type { nil }
    end
  end
end
