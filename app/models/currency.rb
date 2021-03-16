class Currency < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_many :rates, dependent: :destroy
  validates :name, :code, presence: true
end
