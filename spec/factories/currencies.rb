FactoryBot.define do
  factory :currency do
    name { "USD" }
    rate { 75 }
    multiplicity { 1 }
  end
end
