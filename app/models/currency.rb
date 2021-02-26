class Currency < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :wallets, dependent: :destroy
  validates :name, :rate, :multiplicity, presence: true
end
