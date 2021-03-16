class Wallet < ApplicationRecord
  belongs_to :currency
  has_many :cash_flows, dependent: :destroy
  validates :name, :currency_id, presence: true

  scope :currency_ru, -> { where(currency_id: 2) }
end
