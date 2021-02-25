class CashFlow < ApplicationRecord
  belongs_to :wallet
  validates :transact_type, :wallet_id, presence: true

  TRANSACT = ["profit", "cost"]

  #enumeration
  #enum transact_type: {
  #  profit: 10,
  #  cost: 20}
end
