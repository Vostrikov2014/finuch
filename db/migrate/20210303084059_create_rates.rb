class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.date :period
      t.belongs_to :currency, foreign_key: true
      t.numeric :rate
      t.integer :multiplicity

      t.timestamps
    end
  end
end
