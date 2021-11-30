class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :cart_items, through: :carts
  has_many :items, through: :cart_items

  # user.active_cart_items
  def active_cart_items
    carts.last.items
  end

  # user.purchased_carts
  def purchased_carts
    carts.where("status = 'inactive'")
  end

  def active_cart
    carts.where("status = 'active'").first
  end

  # user.for_sale_items
  def for_sale_items
    items
  end
end
