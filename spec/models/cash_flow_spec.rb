require 'rails_helper'

RSpec.describe CashFlow, type: :model do
  it { should validate_presence_of :transact_type }
  it { should validate_presence_of :wallet_id }
end
