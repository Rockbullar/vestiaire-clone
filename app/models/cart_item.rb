class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :item, uniqueness: { scope: :cart }
  # validates :item, uniqueness: true
end
