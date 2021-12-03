# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleanup DB"
CartItem.destroy_all
Item.destroy_all
Cart.destroy_all
User.destroy_all

# SEED ON USER AS SELLER
10.times do
  puts "Creating sellers"
  User.create!({
    email: Faker::Internet.email,
    password: '123456'
  })
  categories = ['Tops', 'Bottoms', 'Accessories', 'Bags']

  4.times do |x|
    item = Item.new({
    name: "#{Faker::Commerce.material} #{categories[x-1]}",
    size: ['S','M','L','XL','Fluffy'].sample,
    categories: categories[x-1],
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    brand: Faker::Commerce.brand,
    is_sold: false,
    user: User.last,
    location: ['Jakarta', 'Bangkok', 'Singapore', 'Manila'].sample,
    condition: ['Very good condition', 'Good condition', 'Fair condition', 'Never worn', 'Never worn, with tag'].sample
    })
    puts "Creating item: #{item.name}"

    filename = File.join(File.dirname(__FILE__),"seeded_images/#{item.categories}/#{(1..7).to_a.sample}")

    puts "Uploading filename: #{filename}"
    file = open("#{filename}.jpg")
    item.image_url.attach(io: file, filename: filename, content_type: 'image/jpg')
    item.save!
  end
end

# SEED ON USER AS BUYER
3.times do
  puts "Creating buyers"
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

puts "Done!"
