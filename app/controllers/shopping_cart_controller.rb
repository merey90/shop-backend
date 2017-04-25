class ShoppingCartController < ApplicationController

  # GET /shopping-carts
  def index
    @user_shopping_cart = current_user.product_varieties
    render json: @user_shopping_cart
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

  private

    # Only allow a trusted parameter "white list" through.
    def shopping_cart_params
      params.require(:product).permit(:id)
    end
end
