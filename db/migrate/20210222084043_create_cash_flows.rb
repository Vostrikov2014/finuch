class CreateCashFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :cash_flows do |t|
      t.string :transact_type
      t.belongs_to :wallet, foreign_key: true
      t.datetime :transact_at
      t.decimal :cash, precision: 15, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
