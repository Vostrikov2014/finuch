FactoryBot.define do
  factory :currency do
    name { "MyString" }
    rate { 22 }
    multiplicity { 1 }
  end
end
