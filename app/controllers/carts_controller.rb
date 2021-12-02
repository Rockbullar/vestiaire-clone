class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout]
  def active
    if current_user.carts.count === 0
      Cart.create!(user: current_user, status: 'active')
    end
    @cart = current_user.active_cart
  end

  def checkout
    if @cart.items.count <= 0
      flash.alert = "Cart is empty!"
      redirect_back(fallback_location: root_path)
    else
      @cart.update(status: 'inactive')
      Cart.create(status: 'active', user: @cart.user)
      @cart.items.each do |item|
        item.update(is_sold: true)
      end
      flash.alert = "Cart checked out"
      redirect_to cart_path
    end
  end

  def history
    @carts = current_user.purchased_carts
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
