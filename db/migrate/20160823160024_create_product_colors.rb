class CreateProductColors < ActiveRecord::Migration[5.0]
  def change
    create_table :product_colors do |t|
      t.string :color
      t.string :code

      t.timestamps
    end
  end
end
