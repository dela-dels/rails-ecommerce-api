class CreateProductOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :product_options do |t|
      t.text :name
      t.string :description
      t.datetime :disabled_at, null: true

      t.timestamps
    end
    add_index :product_options, :name, unique: true
  end
end
