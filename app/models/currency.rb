class Currency < ApplicationRecord
  has_many :invoices
  has_many :wallets
  validates :name, :rate, :multiplicity, presence: true
end
