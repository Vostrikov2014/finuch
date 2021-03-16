FactoryBot.define do
  factory :rate do
    period { Date.today }
    currency
    rate { 75 }
    multiplicity { 1 }

    trait :invalid do
      period { nil }
      currency { nil }
    end
  end
end
