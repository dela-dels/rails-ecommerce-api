class CreateProductOptionValues < ActiveRecord::Migration[8.0]
  def change
    create_table :product_option_values do |t|
      t.text :name
      t.datetime :disabled_at
      t.string :value
      t.decimal :price
      t.integer :available_stock
      t.integer :restock_level

      t.references :product_option, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
