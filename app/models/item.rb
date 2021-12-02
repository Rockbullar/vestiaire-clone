class Item < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  validate :size_check
  validate :category_check
  has_one_attached :image_url

  private

  def size_check
    if size.present? && ['S','M','L','XL','Fluffy'].include?(size) == false
      errors.add(:size, "Must be S, M, L, XL, or Fluffy!")
    end
  end

  def category_check
    if categories.present? && ['Tops', 'Bottoms', 'Accessories', 'Bags'].include?(categories) == false
      errors.add(:categories, "S, M, L, XL, Fluffy!")
    end
  end
end
