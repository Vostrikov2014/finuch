class Wallet < ApplicationRecord
  belongs_to :currency
  has_many :cash_flows
  validates :name, :currency_id, presence: true
end
