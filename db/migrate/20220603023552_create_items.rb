class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
