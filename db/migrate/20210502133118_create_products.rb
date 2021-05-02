class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, limit: 64
      t.bigint :category_id
      t.integer :price
      t.string :description, limit: 256
      t.bigint :sale_status_id
      t.bigint :product_status_id
      t.timestamp :regist_date
      t.bigint :user_id
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
