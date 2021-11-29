class CartsController < ApplicationController
  def active
    @user = User.find(params[:user_id])
    @cart = @user.carts[0]
  end
end
