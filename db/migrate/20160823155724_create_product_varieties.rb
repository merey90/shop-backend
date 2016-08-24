class CreateProductVarieties < ActiveRecord::Migration[5.0]
  def change
    create_table :product_varieties do |t|
      t.references :product, foreign_key: true
      t.references :product_size, foreign_key: true
      t.references :product_color, foreign_key: true
      t.integer :status, limit: 1, :default => nil
      t.integer :cost
      t.integer :tariff
      t.integer :sold_price
      t.integer :sold_tariff

      t.timestamps
    end
    add_index :product_varieties, :status
    add_index :product_varieties, :cost
    add_index :product_varieties, :tariff
    add_index :product_varieties, :sold_price
    add_index :product_varieties, :sold_tariff
  end
end
