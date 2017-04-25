class ProductVariety < ApplicationRecord
  belongs_to :product
  belongs_to :product_color
  belongs_to :product_size
  has_many :product_images
  has_and_belongs_to_many :users
end
