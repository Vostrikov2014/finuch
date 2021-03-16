class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :name
      t.belongs_to :currency, foreign_key: true
      t.timestamps
    end
  end
end
