class Rate < ApplicationRecord
  belongs_to :currency
  validates :period, :currency_id, presence: true

end
