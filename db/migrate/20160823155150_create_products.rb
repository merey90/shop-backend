class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :serial, unique:true
      t.string :title
      t.text :description
      t.integer :price
      t.integer :sale
      t.boolean :gender
      t.references :product_type, foreign_key: true

      t.timestamps
    end
    add_index :products, :serial
    add_index :products, :title
    add_index :products, :description
    add_index :products, :price
    add_index :products, :sale
    add_index :products, :gender
  end
end
