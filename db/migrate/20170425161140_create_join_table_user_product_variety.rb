class CreateJoinTableUserProductVariety < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Users, :ProductVarieties do |t|
       t.index [:user_id, :product_variety_id]
       t.index [:product_variety_id, :user_id]
    end
  end
end
