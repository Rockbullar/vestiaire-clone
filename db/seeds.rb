# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
User.destroy_all
# Cart.destroy_all
# CartItem.destroy_all

# SEED ON USER AS SELLER
3.times do
  User.create!({
  email: Faker::Internet.email,
  password: '123456'
  })
  5.times do Item.create!({
  name: Faker::Commerce.product_name,
  description: Faker::TvShows::Suits.quote,
  price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  brand: Faker::Commerce.brand,
  is_sold: false,
  user: User.last
  })
  end
end

# SEED ON USER AS BUYER
3.times do
  User.create!({
  email: Faker::Internet.email,
  password: '123456'
  })
  Cart.create!({
  status: 'active',
  user: User.last
  })
  2.times do CartItem.create!({
  cart: Cart.last,
  item: Item.order(Arel.sql('RANDOM()')).first
  })
  end
end
