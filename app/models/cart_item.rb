class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :item, uniqueness: { scope: :cart, message: "no repeat items in cart" }
  # validates :item, uniqueness: true
end
