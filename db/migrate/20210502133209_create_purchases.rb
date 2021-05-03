class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price
      t.integer :purchase_quantity
      t.string :purchase_company, limit: 128
      t.timestamp :order_date
      t.timestamp :purchase_date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
