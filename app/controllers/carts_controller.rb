class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout]
  before_action :set_user, only: [:active, :history]
  def active
    @cart = @user.carts.last
  end

  def checkout
    @cart.status = 'purchased'
    Cart.create!(status: 'active', user: @cart.user)
    @cart.items.each do |item|
      item.is_sold = true
    end
    flash.alert = "Cart checked out"
    redirect_to user_cart_path(@cart.user)
  end

  def history
    @carts = Cart.where(user: @user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
