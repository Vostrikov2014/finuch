class RemoveRateToCurrencies < ActiveRecord::Migration[6.1]
  def change
    remove_columns(:currencies, :rate, :multiplicity)
  end
end
