class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout]
  before_action :set_user, only: [:active, :history]
  def active
    if @user.carts.count === 0
      Cart.create!(user: @user, status: 'active')
    end
    @cart = @user.active_cart
  end

  def checkout
    @cart.update!(status: 'inactive')
    Cart.create!(status: 'active', user: @cart.user)
    @cart.items.each do |item|
      item.is_sold = true
      item.save
    end
    flash.alert = "Cart checked out"
    redirect_to user_cart_path(@cart.user)
  end

  def history
    @carts = @user.purchased_carts
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
