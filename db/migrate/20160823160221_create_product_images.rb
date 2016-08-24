class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.references :product_variety, foreign_key: true
      t.text :url
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :product_images, :url
  end
end
