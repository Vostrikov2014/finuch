class Currency < ApplicationRecord
  validates :name, :rate, :multiplicity, presence: true
end
