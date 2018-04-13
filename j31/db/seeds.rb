# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# array = Array.new

# for i in 1..12 do
#   array << eval("Item.create(title:'Kitten n°#{i}', description:'Kitten description', price:'9.00', image_url:'wkitten#{i}.png, cart_id=1')")
#   i = i + 1
# end


User.create!(email: "anto@anto.com",
             password:              "password",
             password_confirmation: "password"
             )

Cart.create!(user_id: 1)

12.times do |i|
  # first_name = Faker::Name.first_name
  # last_name = Faker::Name.last_name
  # website = Faker::Internet.url
  # biographie = Faker::Hipster.paragraph(2, true, 4)
  # birth_date = Faker::Date.birthday(18, 65)
  # band = Faker::Hipster.word
  # phone_number = "06" + Faker::Number.number(8)
  # email = "example-#{user+1}@studiomatic.com"
  # password = "password"
  # address = Address.find(Faker::Number.between(1, 10))
  # address_id = address.id
  title = "Kitten n°#{i + 1}"
  description = "description"
  price = 9.0
  image_url = "wkitten#{i + 1}.png"
  cart_id = Cart.find(1)

  Item.create!(title: title,
               description: description,
               price: price,
               image_url: image_url,
               cart: cart_id
               )
end