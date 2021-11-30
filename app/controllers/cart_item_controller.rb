class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to user_cart_path(User.find(@cart_item.cart.user.id))
  end

  def create
    @item = Item.find(params[:item])
    @user = User.find(params[:user])
    if @user.carts.count === 0
      Cart.create!(user: @user, status: 'active')
    end
    CartItem.create!(cart: @user.active_cart, item: @item)
    flash.alert = "Item added to cart"
  end


end
