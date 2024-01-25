class CartItemsController < ApplicationController
  def create
    cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += quantity
    cart_item.save

    redirect_to cart_path, notice: 'Product added to cart.'
  end
end
