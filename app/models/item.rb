class Item < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  validate :size_check
  validate :category_check

  scope :by_price, -> (min_price, max_price) do
    where('price >= ? AND price <= ?', min_price.to_f, max_price.to_f)
  end

  scope :by_categories, -> (categories) do
    where('categories ILIKE ?', categories)
  end

  scope :by_keyword, -> (given_keyword) do
    # sql_query = " \
    #   movies.title ILIKE ? \
    #   OR movies.synopsis ILIKE ? \
    #   OR directors.first_name ILIKE ? \
    #   OR directors.last_name ILIKE ? \
    # "
    sql_query = " \
      items.name ILIKE ? \
      OR items.brand ILIKE ? \
      OR items.categories ILIKE ? \
    "
    where(sql_query, "%#{given_keyword}%", "%#{given_keyword}%", "%#{given_keyword}%")
    # joins(:director).where(sql_query, "%#{given_keyword}%", "%#{given_keyword}%", "%#{given_keyword}%", "%#{given_keyword}%")
  end

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
