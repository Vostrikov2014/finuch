class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name
      t.belongs_to :currency, foreign_key: true
      t.timestamps
    end
  end
end
