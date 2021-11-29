class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :mark_complete]
  before_action :set_user, only: [:active, :history]
  def active
    @user = User.find(params[:user_id])
    @cart = @user.carts[0]
  end

  def history

  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
