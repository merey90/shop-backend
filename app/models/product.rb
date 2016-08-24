class Product < ApplicationRecord
    has_many :product_varieties, dependent: :destroy
    has_many :product_sizes, through: :product_varieties
    has_many :product_images, through: :product_varieties
    has_many :product_color, through: :product_varieties
    belongs_to :product_type
end
