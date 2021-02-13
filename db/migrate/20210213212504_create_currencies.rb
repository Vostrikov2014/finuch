class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.numeric :rate
      t.integer :multiplicity

      t.timestamps
    end
  end
end
