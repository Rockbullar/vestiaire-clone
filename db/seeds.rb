# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
CartItem.destroy_all
Item.destroy_all
Cart.destroy_all
User.destroy_all

# SEED ON USER AS SELLER
3.times do
  User.create!({
    email: Faker::Internet.email,
    password: '123456'
  })
  categories = ['Tops', 'Bottoms', 'Accessories', 'Bags'].sample
  5.times do
    item = Item.new({
    name: Faker::Commerce.product_name,
    size: ['S','M','L','XL','Fluffy'].sample,
    categories: categories,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    brand: Faker::Commerce.brand,
    is_sold: false,
    user: User.last,
    })
    file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
    item.image_url.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    item.save
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
  CartItem.create!({
    cart: Cart.last,
    item: Item.order(Arel.sql('RANDOM()')).first
  })
end
