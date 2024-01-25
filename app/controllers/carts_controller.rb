class CartsController < ApplicationController
  def show
    @cart = current_user.cart || current_user.create_cart
  end
end
