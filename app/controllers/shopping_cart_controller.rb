class ShoppingCartController < ApplicationController

  # GET /shopping-carts
  def index
    @user_shopping_carts = current_user.product_varieties
    render json: @user_shopping_carts
  end

  # Post /shopping-carts
  def create
    @product_variety = ProductVariety.find(shopping_cart_params)
    if(@product_variety)
      current_user.product_varieties << @product_variety
      render json: @product_variety, status: :created, location: @product_variety
    else
      render json: @product_variety.errors, status: :unprocessable_entity
    end
  end

  def remove
    @product_variety = current_user.product_varieties.find(:id)
    @product_variety.remove()
    render json: @product_variety, status: :deleted, location: @product_variety
  end

  private

    # Only allow a trusted parameter "white list" through.
    def shopping_cart_params
      params.require(:product).permit(:id)
    end
end
