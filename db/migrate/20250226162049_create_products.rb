class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :descriptio
      t.decimal :price
      t.integer :quantity_available
      t.integer :restock_level
      t.datetime :disabled_at

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
