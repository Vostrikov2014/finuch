class Invoice < ApplicationRecord
  belongs_to :currency
  validates :name, :currency_id, presence: true
end
