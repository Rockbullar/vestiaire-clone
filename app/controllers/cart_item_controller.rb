class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to user_cart_path(User.find(@cart_item.cart.user.id))
  end

end
