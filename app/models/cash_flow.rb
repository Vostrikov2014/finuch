class CashFlow < ApplicationRecord
  belongs_to :wallet
  validates :transact_type, :wallet_id, :transact_at, presence: true

  TRANSACT = ["profit", "cost"]

  #enumeration
  #enum transact_type: {
  #  profit: 10,
  #  cost: 20}
end
