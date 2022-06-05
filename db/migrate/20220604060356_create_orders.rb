class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :subtotal, null: false

      t.timestamps
    end
  end
end
