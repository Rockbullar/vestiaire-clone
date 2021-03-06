class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to cart_path
  end

  def create
    @item = Item.find(params[:item])
    @user = User.find(params[:user])
    if @user.carts.count === 0
      Cart.create!(user: @user, status: 'active')
    end
    new_item = CartItem.new(cart: @user.active_cart, item: @item)
    if new_item.save
      flash.alert = "Item added to cart"
      redirect_back(fallback_location: root_path)
    else
      flash.alert = "You already have that item in your cart!"
      redirect_back(fallback_location: root_path)
    end
  end


end
