require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :currency_id }
end
